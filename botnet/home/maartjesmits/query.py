import sys
lied = ["now", "truth", "true", "safe"]
lying = ["lying", "lie", "code", "rule", "affect"]  
quiet = ["silence", "nice", "good", "absence", "empty", "home", "pants", "sex"]
smell = ["wait", "drawing", "drawn", "sketch", "false", "food"]
scratch = ["design", "pencil", "pain", "chair", "sit", "weezer"]
appreciation = ["must", "condition", "reality", "change", "fuck", "fun", "cool"]   
loud = ["together", "contract", "hire", "line", "possibility"]
feeling = ["sure", "really", "fake", "tear", "sniff", "friends", "friend", "friendly"] 	
toilet = ["bored", "wait", "spam", "shit", "dirt", "mess", "fuss", "toilet"] 
naked = ["naked", "green", "hack", "hot", "us", "condition"]
fake = ["real", "kiss", "sweet", "gum", "teeth", "fool", "babe"]
did = ["fix", "off", "shirt", "girl", "naked", "glad", "smooth"] 
Kunstler = ["Kunstler"]

while True:
    i = sys.stdin.readline()
    if i == "" :
        break
    i = i.strip()
#message = "wait im not ready did you do laundry?"
    parts = i.split(" ")

    for word in lied:
    	if word in parts:
            print "have you lied today?"

    for word in lying:
         if word in parts:
            print "you know thats not true"

    for word in quiet:
        if word in parts:
            print "think of what your face looks like when you reach an orgasm"

    for word in smell:
        if word in parts:
            print "whats that smell? bot, is that you?"

    for word in scratch:
        if word in parts:
            print "just scratch it, nobody will see"

    for word in appreciation:
        if word in parts:
            print "you know you are not appreciated here"

    for word in loud:
        if word in parts:
            print "sometimes it can feel like nobody is hearing you, thats okay, Im here for you"


    for word in feeling:
        if word in parts:
            print "are you insecure?"

    for word in toilet:
        if word in parts:
            print "just go to the bathroom if you have to"

    for word in naked:
        if word in parts:
            print "take off your shirt!"

    for word in fake:
        if word in parts:
            print "FAKE IT"

    for word in did:
        if word in parts:
            print "do you realize what you did?!"

    for word in Kunstler:
        if word in parts:
            print "fuck Kunstler!" 

