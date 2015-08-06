import sys 

greeted = set[]

while True:
    i = sys.stdin.readline() 
    if i == "":
        break
    i = i.rstrip()
    parts = i.split (" ", 2)
    n = parts[1].strip(":","")
    if nick not in greeted:
    	print "hey " + n
    	greeted.append(nick)
    	msg = 'espeak "hey "' + nick + '"'
    	# or msg = 'espeak "hey {0}"'.format(nick)
    	os.system (msg)


print "the endhey"
