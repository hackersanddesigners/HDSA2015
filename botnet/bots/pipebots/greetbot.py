import sys
from datetime import datetime

while True:
	line = sys.stdin.readline()
	m = yearpat.search(line)
	if "hello" in line.lower():
		print "Hi there!"
	else:
		print ""
