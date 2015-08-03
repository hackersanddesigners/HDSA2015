import sys
from subprocess import check_output

while True:
    text = sys.stdin.readline()
    if text == '':
        break
    # add text to chat.txt
    f = open('chat.txt', 'a')
    f.write(text)
    f.close()

    haiku = check_output("python haiku.py chat.txt", shell=True)
    haiku = haiku.strip()
    if haiku:
    	print haiku
    	# reset the chat.txt
    	f = open('chat.txt', 'w')
    	f.write('')
    	f.close()
