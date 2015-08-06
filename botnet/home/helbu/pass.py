import sys

while True:
	i = sys.stdin.readline()
	if i == '':
		break
	i = i.strip()
	if "o" in i:
		print "_______"
	
print "end " * 4