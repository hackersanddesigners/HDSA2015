import sys
import os

# infinite loop that keeps reading & responding
while True:
    zin = sys.stdin.readline()
    if not zin:
        break
    # do something to xform zin to out
    out = zin.strip("\n")
    out = out.split(" ", 2)
    if out[1] == "anastellar:":
        out = out[-1]
        print(out)

