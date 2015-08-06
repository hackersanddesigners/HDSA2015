# see and test with speechpoetbot.pd

import irc.bot
import time
import datetime
import os

#------------------------------UDP-------------------------------#
import socket

UDP_IP = "127.0.0.1"
UDP_PORT = 5005

#------------------------------UDP-------------------------------#


class monk(irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel
        self.hello=['hello']
 
    def on_nicknameinuse(self, c, e):
        c.nick(c.get_nickname() + "_")
 
    def on_welcome(self, c, e):
        c.join(self.channel)
 
    def on_pubmsg(self, c, e):
        s = e.arguments[0]
#------------------------------UDP-------------------------------#
        sock = socket.socket(socket.AF_INET,    # Internet
                             socket.SOCK_DGRAM) # UDP
        sock.sendto(s, (UDP_IP, UDP_PORT))
#------------------------------UDP-------------------------------#

    def on_welcome(self, c, e):
        print "Bot connected"
        c.join(self.channel,)

    def on_privmsg(self, c, e):
        self.on_pubmsg(c, e)


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

