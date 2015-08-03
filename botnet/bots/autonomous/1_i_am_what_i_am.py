import irc.bot
import random
import string

class HelloBot(irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel

    def on_welcome(self, c, e):
        print "Bot connected"
        c.join(self.channel)

    def on_privmsg(self, c, e):
        self.on_pubmsg(c, e)

    def on_pubmsg(self, c, e):
        # e.target, e.source, e.arguments, e.type
        # print e.arguments
        WORDS = ("...I", "...am", "...what", "...I", "...am")
        word1 = "".join( [random.choice(WORDS)] )
        word2 = "".join( [random.choice(WORDS)] )
        word3 = "".join( [random.choice(WORDS)] )
        word4 = "".join( [random.choice(WORDS)] )
        word5 = "".join( [random.choice(WORDS)] )

        c.privmsg(self.channel, word1 + word2 + word3 + word4 + word5 )

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description='BashBot')
    parser.add_argument('--host', default="localhost", help='host')
    parser.add_argument('--port', type=int, default=6667, help='port')
    parser.add_argument('channel', help='channel to join')
    parser.add_argument('nickname', help='bot nickname')
    args = parser.parse_args()
    if not args.channel.startswith("#"):
        args.channel = "#"+args.channel

    bot = HelloBot(args.channel, args.nickname, args.host, args.port)
    bot.start()

