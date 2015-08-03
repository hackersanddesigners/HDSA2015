import irc.bot
import time
import datetime
import os


class monk(irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel
        self.hello=['hello']

    def on_welcome(self, c, e):
        print "Bot connected"
        c.join(self.channel,)

    def on_privmsg(self, c, e):
        self.on_pubmsg(c, e)

    def on_pubmsg(self, c, e):
        # print e.target, e.source, e.arguments, e.type
        ts = time.time()
        st = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S')
        src=e.source
        pseudo=src.split('!')
        user=pseudo[0]
        s = e.arguments[0]
        print type(s), s
        bible = 'bible'
        if not os.path.isdir(bible):
            os.mkdir(bible)
        f = open('bible/monk_writing_channel'+e.target+'.txt', 'a')
        f.write(st+' //'+str(user)+' : '+s + '\n')
#writing on a local file (creating a directory different as the bot to put the "bible") and inserting the name of the channel in the name of the file

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

    bot = monk(args.channel, args.nickname, args.host, args.port)
    bot.start()

