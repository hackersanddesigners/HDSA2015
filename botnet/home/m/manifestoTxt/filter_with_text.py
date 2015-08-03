import sys
import os
from random import choice
import random
import re

#import nltk
# infinite loop that keeps reading & responding
#while True:
#    zin = sys.stdin.readline()
#    if not zin:
#        break

# do something to form zin to out
txt = 'HackerManifesto.txt'
counter = 0
def sentences(txt):
    txt = ''.join(open(txt).readlines())
    basket = re.split(r' *[\.\?!][\'"\)\]]* *', txt)
    basket = random.choice(basket)
    replaced=basket.replace("designer" , "hacker")
    #print type(replaced)
    return replaced
  
    		
    #return b	

   
replaced = sentences(txt)
#sentance = random.choice(basket)
print replaced
#print type(replaced)
#pick = "designer"


		#print type(sentance)
#print "changeMess"+ sentance

#sentence = choice(basket)
#print(sentance)
