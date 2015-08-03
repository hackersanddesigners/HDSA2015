import sys, re
from datetime import datetime

yearpat = re.compile(r"\b\d\d\d\d\b")

while True:
	line = sys.stdin.readline()
	m = yearpat.search(line)
	if m != None:
		day = datetime(int(m.group(0)), 1, 1)
		print day.strftime("The first day of %Y was a %A")
	else:
		print ""
