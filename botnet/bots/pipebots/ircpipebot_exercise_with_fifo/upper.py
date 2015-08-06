import sys
import os

# infinite loop that keeps reading & responding

while True:
    zin = sys.stdin.readline()
    if not zin:
        break
    out = zin.upper()
    sys.stdout.write(out)
    os.system("espeak \""+ out.strip() + "\"")

