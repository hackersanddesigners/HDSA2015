import sys
import os

# infinite loop that keeps reading & responding

while True:
    zin = sys.stdin.readline()
    if not zin:
        break
    sys.stdout.write(zin)
    os.system("espeak \""+ zin.strip() + "\"")

