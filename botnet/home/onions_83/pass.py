import sys

words_of_4 = []
sentence = "interesting. %swapme% is a very wise woman."

def nameSwap(message, nick):
    words = message.split (" ")
    for word in words:
        if len(word) == 4:
            words_of_4.append(word)
    if len(words_of_4) >= 2:
        msg = sentence.replace('%swapme%', nick)
        return msg
    return None

message = nameSwap(message, nick)