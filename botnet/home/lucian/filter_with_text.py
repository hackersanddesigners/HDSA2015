import sys, os
import nltk, re
import random
import json

from random import choice 
while True:
    i = sys.stdin.readline()
    if i == "":
        break
    i = i.rstrip()
    parts = i.split (" ", 2)
    msg = parts[2]
    #print msg
    words = msg.split (" ")
    maxlength = 0
    maxwords = [ ]
    for word in words:
        if len(word) > maxlength:
            maxlength = len(word)
            maxwords = [ word ]
        elif len(word) == maxlength:
            maxwords.append(word)
    #print maxwords
    #prints longest word from message as var maxwords
    
    bigword = choice(maxwords)
# infinite loop that keeps reading & responding
#while True:
#    zin = sys.stdin.readline()
#    if not zin:
#        break

# do something to form zin to out
    txt = 'woolf_mrs_dalloway.txt'
    def sentences(txt):
        txt = ''.join(open(txt).readlines())
        basket = re.split(r' *[\.\?!][\'"\)\]]* *', txt)
        #print "sentences", basket
        return basket

    basket = sentences(txt)
    shortlist = []
    for sentence in basket:
        if bigword in sentence:
            #print("match ", sentence)
            shortlist.append(sentence)
    if shortlist:
        pick = choice(shortlist)
        print(pick)
    #else:
    #    print("no match")