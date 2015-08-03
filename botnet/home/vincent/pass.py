import sys

while True:
    i = sys.stdin.readline()
    if i == '':
        break
    i = i.strip()
    i = i.replace(" " , "*")
    print i

print 'het einde'

