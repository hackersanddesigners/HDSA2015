#!/usr/bin/env python

import irc.bot
from random import choice
import urllib2, json, urllib
from time import sleep
from padpublish import publish


"""

publishbot

etherpad to html pages publisher


TODO: Generalize this to wrap running publish script as a shell command.
Make generic way to set flags & preview the command.

Shell bot (2)...

Eventually then thread it to allow streaming output...


"""

import re
space = re.compile(r"\s+")
nonword = re.compile(r"\W+")
publishtag = re.compile(r"#publish", re.I)

class Bot(irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel
        self.votes_per_room = {}

    def on_welcome(self, c, e):
        print "JOINED"
        c.join(self.channel)

    def on_privmsg(self, c, e):
        self.on_pubmsg(c, e)

    def on_pubmsg(self, c, e):
        # print e.target, e.source, e.arguments, e.type
        room = self.channel # e.target
        # nick = snick(e.source)
        msg = e.arguments[0].lower()
        # print "msg type", type(msg)
        if publishtag.search(msg) != None:
            publish("http://localhost:9001/api/1.2.9/", apikey, "Start", "Common.css")
            c.privmsg(self.channel, "published to pages")
        # e.target: name of channel (#test)
        # e.source: full handle of speaker (automatist!murtaugh@i.love.debian.org)
        # e.arguments[0]: the actual message
        # e.type should be "pubmsg"

apikey = open("APIKEY.txt").read()

if __name__ == "__main__":

    import sys
    if len(sys.argv) != 4:
        print "Usage: publishbot.py <server[:port]> <channel> <nickname>"
        sys.exit(1)
    s = sys.argv[1].split(":", 1)
    server = s[0]
    if len(s) == 2:
        try:
            port = int(s[1])
        except ValueError:
            print "Error: Erroneous port."
            sys.exit(1)
    else:
        port = 6667
    channel = sys.argv[2]
    nickname = sys.argv[3]
    bot = Bot(channel, nickname, server, port)
    bot.start()

