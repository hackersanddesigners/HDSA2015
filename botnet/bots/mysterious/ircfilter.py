import re, sys
from argparse import ArgumentParser


msgpat = re.compile(ur"^\((.+)\) (.+?): (.*)$")

p = ArgumentParser()
p.add_argument("--block", default=[], action="append", help="nicknames to block")
p.add_argument("--message", default=False, action="store_true", help="output message only")
args = p.parse_args()

block = set()

for b in args.block:
	block.add(b)

while True:
	line = sys.stdin.readline()
	if line == '':
		break
	line = line.decode("utf-8")
	m = msgpat.search(line)
	if m:
		time, speaker, msg = m.groups()
		show = True
		if speaker in block:
			show = False
		
		if show:
			if args.message:
				sys.stdout.write(msg.encode("utf-8")+"\n")
			else:
				sys.stdout.write(line.encode("utf-8"))
			sys.stdout.flush()
	else:
		sys.stdout.write(line)
		sys.stdout.flush()
