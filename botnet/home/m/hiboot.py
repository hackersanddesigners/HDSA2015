# Simple greenbot 

import sys

greeted = []
# create an empty list which will store 

while True:
    i = sys.stdin.readline ():
    if i == "":
    	break

    i = i.rstrip()
    parts = i.split("", 2)
    nick = parts[1]
    nick = nick.strip(":")
    if nick not in greeted:
    	print "Good morning:" + nick
    	nick.append(nick)

