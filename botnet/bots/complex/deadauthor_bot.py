import sys
import socket
import string, random
import urllib2, urlparse
from urlparse import urlparse
import html5lib, signal

HOST="192.168.1.222"
PORT=6667
NICK="dead_author"
CHANNEL = "#2084"
IDENT="morbid"
REALNAME = 'cadavre'
readbuffer=""
nickname = "moose"

s=socket.socket( )
s.connect((HOST, PORT))
s.send("NICK %s\r\n" % NICK)
s.send("USER %s %s bla :%s\r\n" % (IDENT, HOST, REALNAME))
s.send('JOIN #2084' + '\r\n')

def handler(signum, frame):
    print "Nothing found!"
    raise Exception("no results")



dbase = open("rabo.txt")
lines = dbase.readlines()

#select word from answer
def select(frm,lista):
    que = frm.strip().split()
    for rp in que:
        if len(rp) >= 4:
            lista.append(rp)

#get reply

def cleanup(name,list):
    boole = True
    for line in lines:
        if boole:
            miau = urllib2.urlopen(line).read()
            parse = html5lib.parse(miau, namespaceHTMLElements=False)
            mimimi = parse.findall(".//div")
            for mimi in mimimi:
                if mimi.attrib.get("id") == "chaptext":
                    for search in mimi:
                        if search.text != None:
                            searchme = search.text
                            if name in searchme:
                                boole = False
                                yup = searchme.split(".")
                                for y in yup:
                                    if name in y:
                                        list.append(y)
    talk = random.choice(list).encode("utf-8").replace('"'," ") + "."
    talk = talk.replace("\n"," ") 
    talk = talk.replace("Mr.","Cavendish.") 
    return talk.replace("Mrs.","Chansey.")

possibleanswers = []
possiblesearch = []
possiblepublic = []
#regular expressions - take out the odd symbols
while 1:
    signal.signal(signal.SIGALRM, handler)
    signal.alarm(300)
    try:
        text=s.recv(1024)  
        middle = text.split(':')[1]
        user = middle.split("!")[0]
        if text.find("JOIN") !=-1:
            if text.find('PRIVMSG') == -1:
                s.send('PRIVMSG '+user+ " :What a glorious day, don't you think? \r\n")
        if text.find('PRIVMSG') !=-1 and user in text and NICK in text and CHANNEL not in text:
            message = text.split(':')[2]
            del possiblesearch[:]
            del possibleanswers[:]
            if possiblesearch == []:
                select(message,possiblesearch)
                if possiblesearch != []:
                    print possiblesearch, 'available options'
                    query = random.choice(possiblesearch)
                    print query, 'chosen one'
                    signal.signal(signal.SIGALRM, handler)
                    signal.alarm(10)
                    try:
                        talk = cleanup(query.rstrip("."),possibleanswers)
                        print talk, 'message'
                        s.send('PRIVMSG '+user+" :"+talk+ "\r\n")
                    except Exception, exc:
                        print exc
                        s.send('PRIVMSG '+user+" :your words must be left unanswered. \r\n")
                        continue
        elif text.find("PRIVMSG "+ CHANNEL+ " :writer") !=-1 and text.find(user) != NICK:
            publicmessage = text.split(':')[2]
            print publicmessage, "publicmessage"
            searching = publicmessage.split("writer")[1].strip(" ").strip(' \t\n\r')
            print searching, "publicsearch"
            del possiblepublic[:]
            signal.signal(signal.SIGALRM, handler)
            signal.alarm(10)
            try:
                talkit = cleanup(searching,possiblepublic)
                print talkit, 'message'
                s.send('PRIVMSG '+CHANNEL+" :"+ talkit + "\r\n")
            except Exception, exc:
                print exc
                s.send('PRIVMSG '+CHANNEL+" :your words must be left unanswered. \r\n")
                continue


    except Exception, exc:
        print exc

    
    index = open("rabo.txt")
    shuffled= index.readlines()
    random.shuffle(shuffled)
    open("rabo.txt","w").writelines(shuffled)
    index.close()
    if text.find('PING') != -1:                   
        s.send('PONG ' + text.split() [1] + '\r\n')
