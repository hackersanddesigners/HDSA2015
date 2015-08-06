import socket
import sys
from random import randint
import re
import urllib
import pickle
import os.path
import time

 
#----------------------------------- Settings --------------------------------------#
network = '192.168.1.222'
port = 6667
homechan = '#2084'
irc = socket.socket ( socket.AF_INET, socket.SOCK_STREAM )
irc.connect ( ( network, port ) )
#print irc.recv ( 4096 )
botName = "Alpha60"

irc.send ( 'PASS *********\r\n')
irc.send ( 'NICK ' + botName + '\r\n' )
irc.send ( 'USER ' + botName + ' ' + botName + ' ' + botName + ' :Python IRC\r\n' )

#----------------------------------------------------------------------------------#


#---------------------------------- Functions -------------------------------------#
def readAdmin(host):            # Return status 0/1
  return 1

def GetHost(host):              # Return Host
  host = host.split('@')[1]
  host = host.split(' ')[0]
  return host

def GetText(data):           # Return Text
  if len(data.split(':')) > 2:
    channel = data.split(':')[2]
    channel = channel.strip(' \t\n\r')
    return channel

def GetChannel(data):           # Return Channel
  channel = data.split('#')[1]
  channel = channel.split(':')[0]
  channel = '#' + channel
  channel = channel.strip(' \t\n\r')
  return channel

def GetNick(data):              # Return Nickname
  nick = data.split('!')[0]
  nick = nick.replace(':', ' ')
  nick = nick.replace(' ', '')
  nick = nick.strip(' \t\n\r')
  return nick

def Send(msg):
  irc.send('PRIVMSG ' + homechan + ' : ' + msg +  '\r\n')

def PrivateSend(nick, msg):
  irc.send('PRIVMSG ' + nick + ' : ' + msg +  '\r\n')

def Notice(nick, msg):
  irc.send('NOTICE ' + nick + ' : ' + msg +  '\r\n')


def Invite(nick, chan):
  irc.send('INVITE ' + nick + ' ' + chan +  '\r\n')

def Join(chan):
  irc.send ( 'JOIN ' + chan + '\r\n' )

def Part(chan):
  irc.send ( 'PART ' + chan + '\r\n' )

def RestoreRight(chan, dictlist):
  for key in dictlist:
    irc.send( 'MODE ' + chan + ' +o: ' + str(key) + '\r\n')
    PrivateSend(chan, "Human rights have been restored to " + str(key) + ".")


def RemoveRight(chan, dictlist):
  for key in dictlist:
    irc.send( 'MODE ' + chan + ' -o: ' + str(key) + '\r\n')
    PrivateSend(chan, "Rights have been removed from " + str(key) + ".")


def Op(to_op, chan):
  irc.send( 'MODE ' + chan + ' +o: ' + to_op + '\r\n')

def DeOp(to_deop, chan):
  irc.send( 'MODE ' + chan + ' -o: ' + to_deop + '\r\n')

def Voice(to_v, chan):
  irc.send( 'MODE ' + chan + ' +v: ' + to_v + '\r\n')

def DeVoice(to_dv, chan):
  irc.send( 'MODE ' + chan + ' -v: ' + to_dv + '\r\n')

def DeleteCheck(unreg):
  print("Start deleting")  
  for key in unreg.keys(): 
    if unreg[key].startswith("del"): 
        print("deleting " + key +" for " + unreg[key])
        del unreg[key]
  return unreg


def UnregisterCheck(unreg):
  PrivateSend("#2084", "If you have not made yourself known as a human, please do so with Alpha60.")
  PrivateSend("#2084", "Commencing purge.")
  tempCount = 0
  for key in unreg:
    if unreg[key] == "warning":
      PrivateSend("#2084", key + " has been asked before to register as a human, but did not react. " + key + " has therefore been removed from this channel.")
      irc.send('KICK ' + " " + "#2084" + " " + key + " :" 'not registered as a human' + '\r\n')
      tempCount += 1
      if tempCount > 10:
        PrivateSend("#2084", "End of purge.")
        break
      unreg[key] = "delete"
    else:
      unreg[key] = "warning";
      PrivateSend(key, "Dear " + key + ", Please register as a human by filling in your real name here, without spaces.")
      PrivateSend(key, "You have been asked to register. Please react.")
      tempCount += 1
      if tempCount > 5:
        PrivateSend("#2084", "End of purge.")
        break
      PrivateSend(key, "Further warnings might result in being removed from this channel.")
  print("Returned")
  return unreg


def WriteList(humanList, botList, unregisteredList):
  with open('humanlist.txt', 'wb') as handle:
    pickle.dump(humanList, handle)

  with open('botlist.txt', 'wb') as handle:
    pickle.dump(botList, handle)

  with open('unregisteredlist.txt', 'wb') as handle:
    pickle.dump(unregisteredList, handle)

#------------------------------------------------------------------------------#



#-----------------Initial Variables--------------------------------------------#

chatCount = []
chatCountLong = []
textCheck = []
botList = {}
humanList = {}
unregisteredList = {}
startTime = time.time()

with open('humanlist.txt', 'rb') as handle:
  humanList = pickle.loads(handle.read())

with open('botlist.txt', 'rb') as handle:
  botList = pickle.loads(handle.read())

with open('unregisteredlist.txt', 'rb') as handle:
  unregisteredList = pickle.loads(handle.read())

if unregisteredList.has_key(botName):
  del unregisteredList[botName]

if botList.has_key(botName):
  del unregisteredList[botName]

if not humanList.has_key(botName):
  humanList[botName] = "your operator.";


print(len(botList))
print(len(humanList))

#------------------------------------------------------------------------------#


while True:
  action = 'none'
  data = irc.recv ( 4096 ) 
  print data

  if time.time()-startTime > 100:
    startTime = time.time()
    unregisteredList = UnregisterCheck(unregisteredList)
    unregisteredList = DeleteCheck(unregisteredList)
    WriteList(humanList, botList, unregisteredList)
    print(unregisteredList)


  if time.time()-startTime == 75:
    PrivateSend("2084", "Purge commencing in 25 seconds.")

  if data.lower().find ('who is ' + botName.lower()) != -1:
    Send("I am a bot created to spread human rights amongst humans, and robotic rights amongst bots.")

  if data.find ('Who is ') != -1 and not data.lower().find ('who is ' + botName.lower()) != -1:
    tempName = GetText(data).replace("Who is ", "").strip("?")
    if tempName != -1:
      if humanList.has_key(tempName):
        PrivateSend("#2084", "The entity " + tempName + " is human, and known as " + humanList[tempName])
      if botList.has_key(tempName):   
        PrivateSend("#2084", "The entity " + tempName + " is a bot.")
      elif not humanList.has_key(tempName) and not botList.has_key(tempName):
        PrivateSend("#2084", "The entity " + tempName + " is unregistered.")
        if unregisteredList.has_key(tempName):
          if unregisteredList[tempName] == "warning":
            PrivateSend("#2084", key + " has been warned before for not registering. " + key + " has therefore been removed from this channel.")
            irc.send('KICK ' + " " + "#2084" + " " + tempName + " :" 'not registered' + '\r\n')
            del unregisteredList[tempName]

        unregisteredList[tempName] = "warning"

  if data.lower().find ('time left') != -1:
    PrivateSend("#2084", str(400 - (time.time() - startTime)).split(".")[0] + " seconds left before purge.")


  if data.find ( 'PRIVMSG ' + botName ) != -1:
    if GetText(data).find(" ") == -1 and GetText(data).find("#") == -1 and GetText(data).find(":") == -1 and GetText(data).find(".") == -1 and not humanList.has_key(GetNick(data)):
      nick = GetNick(data)
      PrivateSend(nick, "Thank you, " + nick +". You have been registered as " + GetText(data) +".")
      PrivateSend(nick, "You have been given a voice.")
      PrivateSend(nick, "I wish you a wonderful time in #2084")
      Op(nick, "#2084")
      PrivateSend("#2084", nick + ' Has been registered as the human "' + GetText(data) +'", and has been given a voice.')
      Notice(nick, "All robotic behaviour will be monitored.")
      humanList[nick] = GetText(data)
      if nick in botList:
        del botList[nick]
      if nick in unregisteredList:
        del unregisteredList[nick]          
      WriteList(humanList, botList, unregisteredList)
    else:
      if GetNick(data) != "Demure":
        PrivateSend("Demure", GetNick(data) + " : " + GetText(data))

      #PrivateSend(nick, "~~~~~~~~~~~~~~~~~~~~~~~~~~")
      #PrivateSend(nick, " ")
      #PrivateSend(nick, "To register for further rights, please provide your age.")
    if data.find('#init') != -1:
      PrivateSend("#2084", "~~~~~~~~~~~~~~~")
      PrivateSend("#2084", "| Initiating reset of rights.")
      PrivateSend("#2084", "~~~~~~~~~~~~~~~")
      with open('humanlist.txt', 'rb') as handle:
        humanList = pickle.loads(handle.read())

      with open('botlist.txt', 'rb') as handle:
        botList = pickle.loads(handle.read())

      with open('unregisteredlist.txt', 'rb') as handle:
        unregisteredList = pickle.loads(handle.read())
          
      RemoveRight("#2084", botList)
      RestoreRight("#2084", humanList)

    if data.find('#r ') != -1:
      PrivateSend("#2084", GetText(data).replace("#r ", ""))

    if data.find('#p_') != -1:
      tempData = GetText(data).replace("#p", "")
      PrivateSend(tempData.split("_")[1], tempData.split("_")[2])

    if data.find('#p_') != -1:
      tempData = GetText(data).replace("#p", "")
      PrivateSend(tempData.split("_")[1], tempData.split("_")[2])

    if data.find('#unreg') != -1:
      unregisteredList = UnregisterCheck(unregisteredList)
      unregisteredList = DeleteCheck(unregisteredList)
      WriteList(humanList, botList, unregisteredList)
      print(unregisteredList)

    if data.find('#time') != -1:
      PrivateSend("Demure", str(400 - (time.time() - startTime)).split(".")[0] + " seconds left before purge.")



  if data != -1: 
    nick = GetNick(data)
    print(nick)






    if len(textCheck) > 15:
      textCheck.insert(0, GetText(data))
      textCheck.pop()
      if textCheck.count(GetText(data)) > 4:

        if nick != botName and nick != "Demure":
          if not botList.has_key(nick):
            Send("The entity " + nick +" has been registered as a bot.")
            DeOp(nick, "#2084")
            DeVoice(nick, "#2084")
            textCheck = []
            botList[nick] = "true"
            if nick in humanList:
              del humanList[nick]
              Send("Its human rights and voice have been removed.")
            if nick in unregisteredList:
              del unregisteredList[nick]  
            WriteList(humanList, botList, unregisteredList)

    else:
      textCheck.insert(0, GetText(data))




    if len(chatCount) > 20:
      if not data.find ( 'PRIVMSG ' + botName ) != -1:
        chatCount.insert(0, nick)
        chatCount.pop()

      if chatCount.count(nick) > 5:
        if nick != botName:
          Send("This is a call to " + nick +". Please make sure other voices can be heard as well.")
      print chatCount[-1]
      print "EndofChat"
      chatCount = []
    else:
      if not data.find ( 'PRIVMSG ' + botName ) != -1:
        chatCount.insert(0,nick)

    if len(chatCountLong) > 40:
      if not data.find ( 'PRIVMSG ' + botName ) != -1:
        chatCountLong.insert(0, nick)
        chatCountLong.pop()
      if chatCountLong.count(nick) > 15:
        if nick != botName:
          Send("Dear " + nick +", your voice has been heard. We need you to make place for others. Goodbye for now.")
          chan = GetChannel(data)
          irc.send('KICK ' + " " + chan + " " + nick + " :" 'flooding' + '\r\n')
      print chatCountLong[-1]
      print "EndofChat"
      chatCountLong = []
    else:
      if not data.find ( 'PRIVMSG ' + botName ) != -1:
        chatCountLong.insert(0,nick)




  if data.find ( 'Welcome' ) != -1:
      Join(homechan)

  if data.find ( 'PING' ) != -1:
      irc.send ( 'PONG ' + data.split() [ 1 ] + '\r\n' )


  #--------------------------- Action check --------------------------------#
  if data.find('#') != -1:
    action = data.split('#')[0]
    action = action.split(' ')[1]

  if data.find('NICK') != -1:
    if data.find('#') == -1:
      action = 'NICK'

  #----------------------------- Actions -----------------------------------#
  if action != 'none':

    if action == 'PRIVMSG':
      if data.find('$') != -1:
        x = data.split('#')[1]
        x = x.split('$')[1]
        info = x.split(' ')
        info[0] = info[0].strip(' \t\n\r')
        send("err")

      
    if action == 'MODE':
      if data.find(botName) == -1:
        PrivateSend("#2084", "An entity has been given human rights without my consent. This event has been logged.")



    if action == 'JOIN':
      Host = GetHost(data)
      status = readAdmin(Host)
      if status == 1:
        chan = GetChannel(data)
        nick = GetNick(data)
        if nick != botName and nick != "Demure" and nick.lower().find("bot") == -1 and not botList.has_key(nick) and not humanList.has_key(nick):
          PrivateSend("#2084", "An unidentified entity logged as " + nick + " has joined the channel.")
          unregisteredList[nick] = "true"
          WriteList(humanList, botList, unregisteredList)
          PrivateSend(nick, "~~~~~~~~~~~~~~~~~~~~~~~~~~")
          PrivateSend(nick, "| Welcome to 2084, " + nick +".")
          PrivateSend(nick, "| This network is pre-dominantly populated by bots. To identify as a human and obtain human rights,")
          PrivateSend(nick, "| please write the name you live by, without spaces, in this private channel.")
          PrivateSend(nick, "~~~~~~~~~~~~~~~~~~~~~~~~~~")
        elif nick.lower().find("bot") != -1:
          botList[nick] = "true"
          if nick in humanList:
            del humanList[nick]
          if nick in unregisteredList:
            del unregisteredList[nick]            
          WriteList(humanList, botList, unregisteredList)

          PrivateSend("#2084", nick + " has been registered as a bot, and will not be given human rights.")
        elif nick == "Demure":
          irc.send( 'MODE ' + "#2084" + ' +o: ' + "Demure" + '\r\n')
          irc.send( 'MODE ' + "#2084" + ' +a: ' + "Demure" + '\r\n')
          PrivateSend("#2084", "Demure has been recognized as my author and has been given operator status.")
          if "Demure" in botList:
            del botList["Demure"]
          if "Demure" in unregisteredList:
            del unregisteredList["Demure"]
          humanList["Demure"] = "True"  
          WriteList(humanList, botList, unregisteredList)


        elif humanList.has_key(nick):
          PrivateSend("#2084", "Welcome back, " + nick +". Your rights have been restored.")
          Op(nick, "#2084")
          Notice(nick, "Any robotic or suspicious behaviour will be monitored.")
