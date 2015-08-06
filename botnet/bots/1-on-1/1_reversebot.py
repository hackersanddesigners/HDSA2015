import irc.bot


class ReverseBot(irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel

    def on_welcome(self, c, e):
        c.join(self.channel)
        print "join"
        
    def on_privmsg(self, c, e):
        pass

    def on_pubmsg(self, c, e):
        # print e.arguments, e.target, e.source, e.arguments, e.type
        msg = e.arguments[0]
        if "bot" in msg:
            words = msg.split()
            words.reverse()
            msg = " ".join(words)
            c.privmsg(self.channel, msg)

if __name__ == "__main__":
    import sys, argparse

    parser = argparse.ArgumentParser(description='I am a bot!')
    parser.add_argument('--server', default='irc.freenode.net', help='server hostname (default: irc.freenode.net)')
    parser.add_argument('--port', default=6667, type=int, help='server port (default: 6667)')
    parser.add_argument('--channel', default='#botopera', help='channel to join (default: #botopera)')
    parser.add_argument('--nickname', default='reverseb0t', help='bot nickname (default: botoperahost)')

    args = parser.parse_args()
    bot = ReverseBot(args.channel, args.nickname, args.server, args.port)
    bot.start()

