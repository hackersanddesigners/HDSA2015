#!/usr/bin/env python

import irc.bot
from random import choice
import urllib2, json, urllib
from time import sleep

"""
votebot

democracy in chat form




"""

import re
space = re.compile(r"\s+")
nonword = re.compile(r"\W+")
votetag = re.compile(r"#vote", re.I)
resultstag = re.compile(r"#results", re.I)
wordstag = re.compile(r"#words", re.I)
closetag = re.compile(r"#close", re.I)

class Vote (object):
    def __init__(self, initiator=None):
        self.initiator = initiator
        self.votes_per_nick = {}

    def set_vote (self, nick, vote):
        self.votes_per_nick[nick] = vote

    def get_vote (self, nick):
        return self.votes_per_nick.get(nick)

    def dict (self):
        return self.votes_per_nick

def simple_count_results (d):
    votecount = 0
    counts = {}
    for n, vote in d.items():
        if vote not in counts:
            counts[vote] = 0
        counts[vote] += 1
        votecount += 1
    # results = sorted([(x[1], x[0]) for x in counts.items()], reverse=True)
    results = sorted([(x[1], x[0]) for x in counts.items()])
    ret = []
    ret.append(u"Out of {0} total votes".format(votecount))
    for (score, msg) in results:
        ret.append(u"  {0:3d} votes for: '{1}'".format(score, msg))
    return ret

def word_count_results (d):
    votecount = 0
    counts = {}
    for n, vote in d.items():
        for word in vote.split():
            if word not in counts:
                counts[word] = 0
            counts[word] += 1
            votecount += 1
    # results = sorted([(x[1], x[0]) for x in counts.items()], reverse=True)
    results = sorted([(x[1], x[0]) for x in counts.items()])
    ret = []
    ret.append(u"Out of {0} total words".format(votecount))
    for (score, msg) in results:
        ret.append(u"  '{1}': {0:3d}".format(score, msg))
    return ret


def vstrip (msg):
    # ret = nonword.sub("", msg)
    ret = space.sub(" ", msg)
    return ret.strip()

def snick (n):
    if "!" in n:
        return n.split("!", 1)[0]
    return n

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
        nick = snick(e.source)
        msg = e.arguments[0].lower()
        # print "msg type", type(msg)
        if votetag.search(msg) != None:
            if closetag.search(msg) != None:
                vote = self.votes_per_room.get(room)
                if vote:
                    del self.votes_per_room[room]
                    c.privmsg(self.channel, u"This vote is closed...")
                    c.privmsg(self.channel, u"Here are the final results:")
                    for msg in simple_count_results(vote.dict()):
                        c.privmsg(self.channel, msg)
                else:
                    c.privmsg(self.channel, u"There is no active vote")

            elif resultstag.search(msg) != None:
                vote = self.votes_per_room.get(room)
                if vote:
                    c.privmsg(self.channel, u"Here are the (current) results of the vote:")
                    for msg in simple_count_results(vote.dict()):
                        c.privmsg(self.channel, msg)
                else:
                    c.privmsg(self.channel, u"There is no active vote")

            elif wordstag.search(msg) != None:
                vote = self.votes_per_room.get(room)
                if vote:
                    c.privmsg(self.channel, u"Here are the (current) results of the vote:")
                    for msg in word_count_results(vote.dict()):
                        c.privmsg(self.channel, msg)
                else:
                    c.privmsg(self.channel, u"There is no active vote")
            else:
                pre, post = votetag.split(msg, 1)
                pre = vstrip(pre)
                post = vstrip(post)

                if room not in self.votes_per_room:
                    self.votes_per_room[room] = Vote(nick)
                    if e.type == u'pubmsg':
                        c.privmsg(self.channel, u"{0} calls for a vote...".format(nick))
                    else:
                        c.privmsg(self.channel, u"A vote has been called for privately...".format(nick))
                    sleep(1)

                vote = self.votes_per_room[room]
                prev = vote.get_vote(nick)
                self.votes_per_room[room].set_vote(nick, post)
                if e.type == 'pubmsg':
                    if prev == None:
                        c.privmsg(self.channel, u'{0} votes "{1}"'.format(nick, post))
                    else:
                        c.privmsg(self.channel, u'{0} changes vote to "{1}"'.format(nick, post))
                else:
                    c.privmsg(self.channel, u'A private vote for "{0}"'.format(post))
                    c.privmsg(nick, u'You have voted privately for "{0}"'.format(post))

        # e.target: name of channel (#test)
        # e.source: full handle of speaker (automatist!murtaugh@i.love.debian.org)
        # e.arguments[0]: the actual message
        # e.type should be "pubmsg"

if __name__ == "__main__":

    import sys
    if len(sys.argv) != 4:
        print "Usage: votebot.py <server[:port]> <channel> <nickname>"
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

