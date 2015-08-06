import irc.bot, random, os
from random import randint
from time import sleep
import re




class HelloBot(irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel
        #self.myname = nickname

    def on_welcome(self, c, e):
        print "Bot connected"
        c.join(self.channel)
        sleep(randint(1, 3))
        c.privmsg(self.channel, "wow")

    def on_privmsg(self, c, e):
        self.on_pubmsg(c, e)
        sleep(randint(1, 3))
        c.privmsg(self.channel, "wow")
   
    def on_pubmsg(self, c, e):
        print "*", e.arguments
        msg = e.arguments[0]
        sleep(randint(2, 3))
        directory = "//home/relearn/relearn/botnet/bots/dogebot/texts/"
        text = open(directory+"expressions").read().decode("utf-8")
        lines = text.splitlines()
        lines = [x.strip() for x in lines if len(x) > 1 and len(x) < 400 ]
        word1 = random.choice(lines)          
        word1 = word1.strip('\r\n').replace("  ", " ")
        msg = msg.split()
        msg = random.choice(msg)
        if len(msg)<=2:
            text2 = open(directory+"others.txt").read().decode("utf-8")
            lines2 = text2.splitlines()
            lines2 = [x.strip() for x in lines2 if len(x) > 1 and len(x) < 400 ]
            msg = random.choice(lines2)          
            msg = msg.strip('\r\n').replace("  ", " ")
        c.privmsg(self.channel, word1+" "+ msg)

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

