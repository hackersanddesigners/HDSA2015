import sys

while True: 
    i =sys.stdin.readline()
    if i == "": 
        break
    i = i.rstrip()
    i = i.replace(“c”, “***”) 
    print i 

print "the end" 







