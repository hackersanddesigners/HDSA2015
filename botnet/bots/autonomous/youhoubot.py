## says I love you, when someone types message in chat

import irc.bot, random, os
from random import randint
from time import sleep




class HelloBot(irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel
        #self.myname = nickname

    def on_welcome(self, c, e):
        print "Bot connected"
        c.join(self.channel)

    def on_privmsg(self, c, e):
        self.on_pubmsg(c, e)
    
    def on_pubmsg(self, c, e):
        # e.target, e.source, e.arguments, e.type
        print "*", e.arguments
        msg = e.arguments[0]
        sleep(randint(1, 5))
        c.privmsg(self.channel, "I love you "+e.source.nick)




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

