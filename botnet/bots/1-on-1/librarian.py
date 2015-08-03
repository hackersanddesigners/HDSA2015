from urllib import quote_plus
from urllib2 import urlopen
from json import load
import irc.bot
import sys



class Bot(irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel

    def on_welcome(self, c, e):
        print "Bot connected"
        c.join(self.channel)

    def on_privmsg(self, c, e):
        self.on_pubmsg(c, e)

    def on_pubmsg(self, c, e):
        e.target, e.source, e.arguments, e.type
        msg = e.arguments[0].lower()
        words = msg.split()
        word = words[0]
        url = "https://archive.org/advancedsearch.php?q={0}&fl[]=identifier&fl[]=mediatype&sort[]=&sort[]=&sort[]=&rows=50&page=1&output=json"
        url2 = url.format(quote_plus(word))
        resp = load(urlopen(url2))
        docs = resp["response"]["docs"]
        for d in docs[:3]:
            c.privmsg(self.channel, "Hey, you just typed " + word +", maybe this " + d["mediatype"].encode("utf-8") + " will interest you : " + "https://archive.org/details/" + d["identifier"].encode("utf-8").format(msg))


if __name__ == "__main__":
    import sys
    if len(sys.argv) != 4:
        print "Usage: googlebot.py <server[:port]> <channel> <nickname>"
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
    bot = Bot(channel, nickname, server, port)
    bot.start()



