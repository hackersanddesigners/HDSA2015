## Run this script as bot with following command: 
#cat bot | python -u ircpipebot.py --server botnet.local --channel "#botnet" --nickname fembot | python -u fembot.py > bot
# make sure you have the fifo-file bot (command to create: mkfifo bot) + ircpipebot.py in the same folder

import sys

# infinite loop that takes the last message of the chat
while True:
    words_of_4 = []
    message = sys.stdin.readline()
    if message == '':
        break
    # take out blank line
    message = message.rstrip()
    # print message

    # transformation of the message
    
    ## split the message in a list of words, break on spaces between words
    words = message.split(" ")
    # print words
    
    ## find the nickname in the message and strip of the colon
    nick = words[1]
    #print nick
    nick = nick.rstrip(":")
    #print nick
    
    ## loop that checks each word in the list, words with 4 characters are saved in separate list
    for word in words:
        if len(word) == 4:
            words_of_4.append(word)
    
    ## check length of new list, if more than 2 -> send message
    if len(words_of_4) >= 2:
        sentence = "interesting " + nick + " is a very wise woman."
        print sentence


