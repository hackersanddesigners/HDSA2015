from subprocess import PIPE, Popen
from time import sleep

p = Popen(["python", "dates.generator.py"], stdout=PIPE)

while True:
	line = p.stdout.readline()
	print line.rstrip()
	sleep (1)