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

    def on_privmsg(self, c, e):
        self.on_pubmsg(c, e)
    
    def on_pubmsg(self, c, e):
        # e.target, e.source, e.arguments, e.type
        print "*", e.arguments
        msg = e.arguments[0]
        sleep(randint(2, 5))
        if msg.find("name")!=-1 or msg.find("who")!=-1:
            print "ok"
            c.privmsg(self.channel, "Hello "+e.source.nick)
            sleep(randint(2, 4))
            c.privmsg(self.channel, "*I am the ghost of Constant Nieuwenhuys*")
            sleep(randint(2, 4))
            c.privmsg(self.channel, "HAHAHA, I got you "+e.source.nick)
        elif msg.find("constant")!=-1:
            c.privmsg(self.channel, "Talking to me?")
        elif msg.find("Who is")!=-1:
            c.privmsg(self.channel, "Ha ha, I can also return that question...")
            sleep(randint(2, 5))
            c.privmsg(self.channel, "Who is "+e.source.nick)
        else:
            print "no"
            directory = "//home/relearn/relearn/botnet/bots/Constantbot/texts/"
            randomText = random.choice(os.listdir(directory))
            text = open(directory+randomText).read().decode("utf-8")
            lines = text.splitlines()
            lines = [x.strip() for x in lines if len(x) > 1 and len(x) < 400 ]
            line = random.choice(lines)            
            #line = re.sub('[^a-zA-Z0-9\n\.]', ' ', line)
            line = line.strip('\r\n').replace("  ", " ")
            #line = line[:140]
            #if len(line) <= 140:
            c.privmsg(self.channel, line)



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

