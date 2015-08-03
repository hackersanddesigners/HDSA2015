import sys

while True:
    i = sys.stdin.readline()
    if i == '':
        break
    i = i.rstrip()
    if "hello" in i:
        print "HELLO!!!!!"
    # i = i.replace(" ", "*")
    # print i

print "the end"
