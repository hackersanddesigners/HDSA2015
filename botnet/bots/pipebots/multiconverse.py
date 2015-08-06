import sys
from subprocess import PIPE, Popen
from random import choice

# nb: -u ensures that the subprocess runs with no input/output buffering
# (Observed to be significant, running python 2.7.3 from the bash)

mods = ["uppercase.py", "greetbot.py", "firstday.py"]

def open_proc (p):
	return Popen(["python", "-u", p], stdout=PIPE, stdin=PIPE)

procs = [open_proc(x) for x in mods]

while True:
	# Read a line of input
	line = sys.stdin.readline()
	if line == '':
		sys.exit(0)

	responses = []
	for i, p in enumerate(procs):
		# Send the line to subprocesses
		p.stdin.write(line)
		p.stdin.flush()

		# Read the response
		r = p.stdout.readline().rstrip()
		print i, r
		if len(r) > 0:
			responses.append(r)

	if len(responses) > 0:
		print choice(responses)
	else:
		print ""
