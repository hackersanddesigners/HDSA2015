import sys, os

while True:
    i = sys.stdin.readline()
    if i == "":
        break
    i = i.rstrip()
    parts = i.split (" ", 2)
    msg = parts[2]
    print msg
    words = msg.split (" ")
    maxlength = 0
    maxwords = [ ]
    for word in words:
        if len(word) > maxlength:
            maxlength = len(word)
            maxwords = [ word ]
        elif len(word) == maxlength:
            maxwords.append(word)
    print maxwords, ": ", maxlength
    
    

print "end script"