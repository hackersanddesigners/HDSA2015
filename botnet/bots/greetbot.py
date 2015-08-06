# greetbot.py

from random import choice
import sys, os

seen = set()

while True:
    i = sys.stdin.readline()
    if i == '':
        break
    i = i.rstrip()
    (time, nick, msg) = i.split(" ", 2)
    nick = nick.rstrip(":")
    if nick not in seen:
        seen.add(nick)
        print "Good morning " + nick
        os.system('espeak "Good morning {0}"'.format(nick))
