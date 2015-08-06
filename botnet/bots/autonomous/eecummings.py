# E. E. Cummings (1894 - 1962)

import irc.bot
import random
import string
 
class HelloBot(irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel

    def on_welcome(self, c, e):
        print "E. E. Cummings"
        c.join(self.channel)

    def on_privmsg(self, c, e):
        self.on_pubmsg(c, e)

    def on_pubmsg(self, c, e):
        # e.target, e.source, e.arguments, e.type
        # print e.arguments
        # PERMUT = ["I", "am", "that", "I", "am"]
        # random.shuffle(PERMUT)
        # c.privmsg(self.channel, PERMUT)

        WORDS = [" I A)m", " (aM", " TrY to", " I", " aM", " rea)", " lL", "aN", "Dd", " (feel", " ing)", " t(He", " w(o", "-r-lD"]
        random.shuffle(WORDS)
        shuffled1 = ''.join(random.sample(WORDS, len(WORDS)))  
        shuffled2 = ''.join(random.sample(WORDS, len(WORDS))) 
        shuffled3 = ''.join(random.sample(WORDS, len(WORDS)))  
        c.privmsg(self.channel, shuffled1 + shuffled3)
        c.privmsg(self.channel, shuffled2)
        c.privmsg(self.channel, shuffled3 + shuffled2)
        c.privmsg(self.channel, shuffled1)

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
