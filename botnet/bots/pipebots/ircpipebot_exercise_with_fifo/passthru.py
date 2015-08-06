import sys
import os

# infinite loop that keeps reading & responding
while True:
    zin = sys.stdin.readline()
    if not zin:
        break
    # do something to xform zin to out
    out = zin.strip("\n")
    print(out)

