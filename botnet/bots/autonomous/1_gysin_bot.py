# Brion Gysin "I am that I am"

import irc.bot
import random
import string

class HelloBot(irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel

    def on_welcome(self, c, e):
        print "I am that I am"
        c.join(self.channel)

    def on_privmsg(self, c, e):
        self.on_pubmsg(c, e)

    def on_pubmsg(self, c, e):
        # e.target, e.source, e.arguments, e.type
        # print e.arguments
        # PERMUT = ["I", "am", "that", "I", "am"]
        # random.shuffle(PERMUT)
        # c.privmsg(self.channel, PERMUT)

        WORDS = [" I", " am", " that", " I", " am"]
        random.shuffle(WORDS)
        shuffled = ''.join(random.sample(WORDS, len(WORDS)))  
        c.privmsg(self.channel, shuffled)

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

