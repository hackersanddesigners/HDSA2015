import sys
from datetime import datetime, timedelta

now = datetime.now()

while True:
	line = sys.stdin.readline()
	if line:
		print now.strftime("%A %d %B, %Y")
		# sys.stdout.flush()
		now = now + timedelta(1)

