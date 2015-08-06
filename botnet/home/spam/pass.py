import sys

while True:
    i = sys.stdin.readline()
    if i == "":
        break
    i = i.rstrip()
    if "hello" in i:
	print "hello"*100
    #i = i.replace(" ", "*")
    print i

# when you hit ctrl d it gives the end message
#print "the end"


