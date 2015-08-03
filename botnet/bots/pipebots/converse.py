import sys
from subprocess import PIPE, Popen

# nb: -u ensures that the subprocess runs with no input/output buffering
# (Observed to be significant, running python 2.7.3 from the bash)
dates = Popen(["python", "-u", "uppercase.py"], stdout=PIPE, stdin=PIPE)

while True:
	# Read a line of input
	line = sys.stdin.readline()
	if line == '':
		sys.exit(0)

	# Send the line to subprocess
	dates.stdin.write(line)
	dates.stdin.flush()

	# Read the response
	response = dates.stdout.readline()

	# Print the response
	print response.rstrip()
