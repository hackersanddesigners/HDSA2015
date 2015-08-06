from __future__ import print_function
import sys

while True:
	line = sys.stdin.readline()
	if line == '':
		break
	# print ("uppercase"+line.upper(), file=sys.stderr)
	sys.stdout.write(line.upper())
