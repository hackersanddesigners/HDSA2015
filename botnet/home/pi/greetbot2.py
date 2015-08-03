from __future__ import print_function
import irc.bot
import sys, time, os

class Bot (irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667, idle=False):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.nickname = nickname
        self.channel = channel

    def on_welcome(self, c, e):
        c.join(self.channel)
        print ("join", file=sys.stderr)

    def on_join(self, c, e):
        # print ("JOIN", c, e, file=sys.stderr)
        nick = e.source.split("!", 1)[0]
        if nick != self.nickname:
            c.privmsg(self.channel, "good morning {0}".format(nick))
            os.system('espeak "good morning {0}"'.format(nick))

        
    def on_pubmsg(self, c, e):
        # e.target, e.source, e.arguments, e.type
        msg = e.arguments[0]
        tstr = time.strftime("%H:%M:%S", time.localtime())
        nick = e.source.split("!", 1)[0]
        
if __name__ == "__main__":
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument('--server', default='localhost', help='server hostname (default: localhost)')
    parser.add_argument('--port', default=6667, type=int, help='server port (default: 6667)')
    parser.add_argument('--channel', default='#botnet', help='channel to join (default: #botnet)')
    parser.add_argument('--nickname', default='greetbot', help='bot nickname (default: greetbot)')
    args = parser.parse_args()

    bot = Bot(args.channel, args.nickname, args.server, port=args.port)
    bot.start()
