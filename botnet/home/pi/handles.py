import sys

nicks = {}

for line in sys.stdin:
	p = line.strip().split(" ", 2)
	print p
	if len(p) == 3:
		nick = p[1].strip(":")
		nicks[nick] = True

nicks = nicks.keys()
nicks.sort()
for n in nicks:
	print n


