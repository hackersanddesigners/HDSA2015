import sys
import os
from random import choice
import nltk, re

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
sentence = choice(basket)
print(sentence)


