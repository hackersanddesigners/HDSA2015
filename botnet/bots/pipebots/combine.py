import sys
from subprocess import PIPE, Popen
from random import choice
import json

# nb: -u ensures that the subprocess runs with no input/output buffering
# (Observed to be significant, running python 2.7.3 from the bash)

## accept list of (named) pipes ... processes
## start each up...
## feed stdin to them...
## watch output,
## maintain a "spigot" that routes one at a time

from argparse import ArgumentParser
from thread import start_new_thread

p = ArgumentParser(description="Takes multiple inputs, and combines output")
p.add_argument("--input", action="append")
args = p.parse_args()
print args.input

# control protocol to select output...

class Reader ():
	def __init__(self, pname):
		self.pname = pname

	def start (self):
		start_new_thread(self.readloop, ())

	def readloop (self):
		with open(self.pname) as f:
			while True:
				line = f.readline()
				if line == '':
					break
				print ("<{0}> read {1}".format(self.pname, line.strip()), file=sys.stderr)

	def write (self, data):
		if self.stdout == None:
			self.stdout = open(self.pname, "w")
		self.stdout.write(data)

def on_read (reader, data):
	sys.stdout.write(data)

readers = []
active_reader = None
for i in args.input:
	r = Reader(i, on_read)
	readers.append(r)
	if active_reader == None:
		active_reader = r
	r.start()

while True:
	line = sys.stdin.readline()
	if line == '':
		break
	for r in readers:
		r.write(line)



# adapter to collect different input bundles and select on at random (after the fact?)

# def open_proc (p):
# 	return Popen(["python", "-u", p], stdout=PIPE, stdin=PIPE)
# procs = [open_proc(x) for x in mods]

# while True:
# 	# Read a line of input
# 	line = sys.stdin.readline()
# 	if line == '':
# 		sys.exit(0)

# 	responses = []
# 	for i, p in enumerate(procs):
# 		# Send the line to subprocesses
# 		p.stdin.write(line)
# 		p.stdin.flush()

# 		# Read the response
# 		r = p.stdout.readline().rstrip()
# 		print i, r
# 		if len(r) > 0:
# 			responses.append(r)

# 	if len(responses) > 0:
# 		print choice(responses)
# 	else:
# 		print ""
