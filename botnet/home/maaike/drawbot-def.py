import irc.bot
import sys, time, os
import serial
import time

# Init Arduino - JBG
port = '/dev/cu.usbmodem1411'
ard = serial.Serial(port,9600,timeout=5)
time.sleep(1) # wait for Arduino

class Bot (irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667, idle=False):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.nickname = nickname
        self.channel = channel

    def on_welcome(self, c, e):
        c.join(self.channel)
        print "join"

    def on_join(self, c, e):
        
        nick = e.source.split("!", 1)[0]
        print "JOIN", nick
        ard.write("m")
        ard.flush()
        # if nick != self.nickname:
        #     c.privmsg(self.channel, "good morning {0}".format(nick))
        #     os.system('espeak "good morning {0}"'.format(nick))

    def on_part(self, c, e):
        nick = e.source.split("!", 1)[0]
        print "PART", nick
        ard.write("z")
        ard.flush()
        # if nick != self.nickname:
        #     c.privmsg(self.channel, "good morning {0}".format(nick))
        #     os.system('espeak "good morning {0}"'.format(nick))


        
    def on_pubmsg(self, c, e):
        # e.target, e.source, e.arguments, e.type
        msg = e.arguments[0]
        tstr = time.strftime("%H:%M:%S", time.localtime())
        nick = e.source.split("!", 1)[0]
        
if __name__ == "__main__":
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument('--server', default='botnet.local', help='server hostname (default: )')
    parser.add_argument('--port', default=6667, type=int, help='server port (default: 6667)')
    parser.add_argument('--channel', default='#botnet', help='channel to join (default: #botnet)')
    parser.add_argument('--nickname', default='drawbot', help='bot nickname (default: drawbot)')
    args = parser.parse_args()

    bot = Bot(args.channel, args.nickname, args.server, port=args.port)
    bot.start()
