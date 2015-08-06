import math
import time
import sys
import os

seconds = 0

birthCount = 0
deathCount = 0

while True:
	birthCount = birthCount + 4.25
	deathCount = deathCount + 1.75
	if seconds % 42 == 0:
		m=str(int(math.ceil(birthCount))) + " Menschen sind Kunstler"
		print m
		os.system("espeak -v de \""+ m + "\"")

	if seconds % 53 == 0:
		p=str(int(math.ceil(deathCount))) + " Menschen waren Kunstler"
		print p
		os.system("espeak -v de \""+ p + "\"")
	seconds += 1
	time.sleep (1)