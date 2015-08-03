import sys

while True:
	i = sys.stdin.readline()
	if i == "":
       		 break
	i = i.rstrip() 
	i = i.replace("m","&")
	print i

print "the end or is it"
