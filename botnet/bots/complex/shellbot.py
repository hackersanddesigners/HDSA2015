import irc.bot
import subprocess

def chunks(text, n):
    """ Yield successive n-sized chunks from l.
    """
    lines = text.splitlines()

    for line in lines:
        for i in xrange(0, len(line), n):
            yield line[i:i+n]

class ShellBot(irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel

    def on_welcome(self, c, e):
        c.join(self.channel)

    def on_privmsg(self, c, e):
        pass

    def on_pubmsg(self, c, e):
        # e.target, e.source, e.arguments, e.type
        # print e.arguments
        msg = e.arguments[0].decode("utf-8")
        if msg.startswith("!"):
            msg = msg.lstrip("!")
            try:
                output = subprocess.check_output(msg, shell=True)
                output = output.decode("utf-8")
                print "output", output
            except subprocess.CalledProcessError, e:
                output = e.output
            except Exception, e:
                output = str(e)
            self.say_public(output)

    def say_public(self, text):
        "Print TEXT into public channel, for all to see."
        for c in chunks(text, 400):
            print "say_public", type(c), c
            self.connection.privmsg(self.channel, c)


if __name__ == "__main__":
    import sys
    if len(sys.argv) != 4:
        print "Usage: shellbot.py <server[:port]> <channel> <nickname>"
        sys.exit(1)
    s = sys.argv[1].split(":", 1)
    server = s[0]
    if len(s) == 2:
        try:
            port = int(s[1])
        except ValueError:
            print "Error: Erroneous port."
            sys.exit(1)
    else:
        port = 6667
    channel = sys.argv[2]
    nickname = sys.argv[3]
    bot = ShellBot(channel, nickname, server, port)
    bot.start()

