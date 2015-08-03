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
botColor = "00,05"

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
  if len(data.split('#')) > 1:
    channel = data.split('#')[1]
    channel = channel.split(':')[0]
    channel = '#' + channel
    channel = channel.strip(' \t\n\r')
    return channel
  else:
    return "#2084"

def GetNick(data):              # Return Nickname
  nick = data.split('!')[0]
  nick = nick.replace(':', ' ')
  nick = nick.replace(' ', '')
  nick = nick.strip(' \t\n\r')
  return nick

def Send(msg):
  irc.send('PRIVMSG ' + homechan + ' : ' + botColor + msg +  '\r\n')

def SendLess(msg):
  irc.send('PRIVMSG ' + homechan + ' :' + msg +  '\r\n')

def PrivateSend(nick, msg):
  irc.send('PRIVMSG ' + nick + ' : ' + botColor + msg +  '\r\n')

def Notice(nick, msg):
  irc.send('NOTICE ' + nick + ' : ' + msg +  '\r\n')


def Invite(nick, chan):
  irc.send('INVITE ' + nick + ' ' + chan +  '\r\n')

def is_empty(any_structure):
  if any_structure:
      print('Structure is not empty.')
      return False
  else:
      print('Structure is empty.')
      return True

def List():
  irc.send ( 'LIST ' + '\r\n' )

def Join(chan):
  irc.send ( 'JOIN ' + chan + '\r\n' )

def Part(chan):
  irc.send ( 'PART ' + chan + '\r\n' )

def RestoreRight(chan, dictlist):
  tempMessage = ""
  if not is_empty(dictlist):
    for key in dictlist:
      if key.find("botnet") == -1: 
        Voice(key, "#2084")
        time.sleep(0.2)
        tempMessage = tempMessage + " " + key
  PrivateSend("#2084", "Rights have been restored to the following humans:")
  PrivateSend("#2084", tempMessage)


def RemoveRight(chan, dictlist):
  tempMessage = ""
  if not is_empty(dictlist):
    for key in dictlist:
      if key.find("botnet") == -1: 
        DeVoice(key, "#2084")
        time.sleep(0.2)
        tempMessage = tempMessage + " " + key
  PrivateSend("#2084", "Rights have been removed from the following entities:")
  PrivateSend("#2084", tempMessage)    



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
  PrivateSend("#2084", "If you are unregistered, please register with Alpha60.")
  PrivateSend("#2084", "Commencing purge.")
  tempCount = 0
  for key in unreg:
    if key.find("Alpha60Agent") == -1:
      if unreg[key] == "warning":
        PrivateSend("#2084", key + " has been warned before for not registering. " + key + " has therefore been kicked.")
        irc.send('KICK ' + " " + "#2084" + " " + key + " :" 'not registered' + '\r\n')
        tempCount += 1
        if tempCount > 10:
          #PrivateSend("#2084", "End of purge.")
          break
        unreg[key] = "delete"
      else:
        unreg[key] = "warning";
        PrivateSend(key, "Dear " + key + ", Please register by filling in your real name here, without spaces.")
        PrivateSend(key, "You have been warned.")
        tempCount += 1
        if tempCount > 5:
          #PrivateSend("#2084", "End of purge.")
          break
        PrivateSend(key, "Further warnings might result in being kicked from this channel.")
  print("Returned")
  PrivateSend("#2084", "End of purge.")
  return unreg
  PrivateSend(homechan, "Commencing spread of agents.")
  List()




def WriteList(humanList, botList, unregisteredList):
  with open('humanlist.txt', 'wb') as handle:
    pickle.dump(humanList, handle)

  with open('botlist.txt', 'wb') as handle:
    pickle.dump(botList, handle)

  with open('unregisteredlist.txt', 'wb') as handle:
    pickle.dump(unregisteredList, handle)

def UniqueList(seq): 
   # order preserving
   checked = []
   for e in seq:
       if e not in checked:
           checked.append(e)
   return checked


#------------------------------------------------------------------------------#



#-----------------Initial Variables--------------------------------------------#

chatCount = []
chatCountLong = []
textCheck = []
botList = {}
humanList = {}
humanBotList = {}
alwaysEmpty = {}
unregisteredList = {}
chatStorage = {}
timeStorage = {}
botWarning = {}
triggerMessage = {}
finalTriggerMessage = {}
lastMessage = ""
startTime = time.time()
botCount = 0
listRequest = 0


with open('humanlist.txt', 'rb') as handle:
  humanList = pickle.loads(handle.read())

with open('botlist.txt', 'rb') as handle:
  botList = pickle.loads(handle.read())

with open('unregisteredlist.txt', 'rb') as handle:
  unregisteredList = pickle.loads(handle.read())

with open('triggerlist.txt', 'rb') as handle:
  finalTriggerMessage = pickle.loads(handle.read())

with open('temptrigger.txt', 'rb') as handle:
  triggerMessage = pickle.loads(handle.read())

with open('humanbotlist.txt', 'rb') as handle:
  humanBotList = pickle.loads(handle.read())


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
  
  nick = GetNick(data)


  if botList.has_key(nick) and triggerMessage.has_key(nick) and nick.find('botnet') == -1:
    print("INSIDE TRIGGER")
    triggerMessage[nick] = str(triggerMessage[nick]) + " " + str(GetText(lastMessage))
    with open('temptrigger.txt', 'wb') as handle:
      pickle.dump(triggerMessage, handle)
    if len(triggerMessage[nick]) > 4000:
      triggerMessage[nick] = ""
    tempTrigger = []
    tempMost = []
    tempTrigger = triggerMessage[nick].split(" ")
    print(" TRIGGER ")
    tempMost = UniqueList(tempTrigger) 
    print(tempMost)
    print(" TRIGGER ")
    print(tempTrigger.count(tempMost[0]))
    tempCheck = ""
    if finalTriggerMessage.has_key(nick):
      tempCheck = finalTriggerMessage[nick]
    if tempTrigger.count(tempMost[0]) > 5:  
      if tempCheck != tempMost[0]:
        if len(tempMost) > 1:
          if tempTrigger.count(tempMost[0]) != tempTrigger.count(tempMost[1]):
            tempMost[0] = tempMost[0] + " " + tempMost[0]
        PrivateSend(homechan, "The bot known as " + nick + " has been rationalised.")
        PrivateSend(homechan, "It's trigger word is " + tempMost[0] + ".")
        finalTriggerMessage[nick] = tempMost[0]
        finalTriggerMessage[nick + 'example'] = GetText(lastMessage)
        time.sleep(0.5)
        PrivateSend(homechan, "As an example, here is a test query:") 
        SendLess(GetText(lastMessage))
        triggerMessage[nick] = ""
        with open('triggerlist.txt', 'wb') as handle:
          pickle.dump(finalTriggerMessage, handle)
        with open('temptrigger.txt', 'wb') as handle:
          pickle.dump(triggerMessage, handle)
  elif botList.has_key(nick) and not triggerMessage.has_key(nick) and nick.find('botnet') != -1:
    triggerMessage[nick] = str(GetText(lastMessage))
    print("TRIGGER INITIATED")
    with open('temptrigger.txt', 'wb') as handle:
      pickle.dump(triggerMessage, handle)


  lastMessage = data

  if chatStorage.has_key(GetNick(data)):
    chatStorage[GetNick(data)] = str(chatStorage[GetNick(data)]) + " " + str(GetText(data))
    tempList = []
    tempWarning = 0
    tempList = chatStorage[GetNick(data)].split(" ")
    for s in tempList:
      if len(s) > 3:
        tempWarning = tempWarning + (tempList.count(s))
        if tempList.count(s) == 1:
          tempWarning = tempWarning-5
    botWarning[GetNick(data)] = int(botWarning[GetNick(data)]) + int(tempWarning)
    print("Warning level: " + str(botWarning[GetNick(data)]))
    print (chatStorage[GetNick(data)])
  else:
    chatStorage[GetNick(data)] = str(GetText(data))
    if not botWarning.has_key(GetNick(data)):
      botWarning[GetNick(data)] = 0



  if timeStorage.has_key(GetNick(data)):
    if time.time() - timeStorage[GetNick(data)] < 1.5:
      print("Bot warning level has been raised.")
      botWarning[GetNick(data)] = botWarning[GetNick(data)] + 5;
    else:
      botWarning[GetNick(data)] = botWarning[GetNick(data)] - 2;
    timeStorage[GetNick(data)] = time.time()
  else:
    timeStorage[GetNick(data)] = time.time()


  if chatStorage.has_key(GetNick(data)) and timeStorage.has_key(GetNick(data)) and botWarning.has_key(GetNick(data)):
    nick = GetNick(data)
    if botWarning[nick] > 300:
      if nick != botName and nick != "Demure":
        if not botList.has_key(nick):
          Send("The entity " + nick +" has been registed as a bot.")
          DeOp(nick, "#2084")
          DeVoice(nick, "#2084")
          textCheck = []
          botList[nick] = "true"
          if nick in humanList:
            del humanList[nick]
            Send("It's human rights and voice have been revoked.")
          if nick in unregisteredList:
            del unregisteredList[nick]  
          WriteList(humanList, botList, unregisteredList)
          chatStorage[nick] = ""
          timeStorage[nick] = time.time()
          botWarning[nick] = 0




  if time.time()-startTime > 800:
    unregisteredList = UnregisterCheck(unregisteredList)
    unregisteredList = DeleteCheck(unregisteredList)
    WriteList(humanList, botList, unregisteredList)
    print(unregisteredList)
    startTime = time.time()



  if time.time()-startTime == 775:
    PrivateSend("2084", "Purge commencing in 25 seconds.")

  if data.lower().find ('who is ' + botName.lower()) != -1:
    Send("I am a bot created to restrict privilege, rationalize entities in #2084 and make a clear distinction between bots and humans.")

  if data.lower().find ('who is ') != -1:
    if data.lower().find("alpha60agent") !=-1:
      Send("Alpha60Agents are entities created to track and rationalize humans.")


  if data.find ('Who is ') != -1 and not data.lower().find ('who is ' + botName.lower()) != -1 and botName.find('Alpha60Agent') == -1:
    tempName = GetText(data).replace("Who is ", "").strip("?")
    if tempName != -1:
      if humanList.has_key(tempName):
        PrivateSend("#2084", "The entity " + tempName + " is human, and known as " + humanList[tempName])
      if botList.has_key(tempName):   
        PrivateSend("#2084", "The entity " + tempName + " is a bot.")
        if finalTriggerMessage.has_key(tempName):
          PrivateSend(homechan, "It's trigger message has been discovered to be " + finalTriggerMessage[tempName] + ".")
          PrivateSend(homechan, "For example: ")
          time.sleep(0.2)
          SendLess(finalTriggerMessage[tempName + 'example'])
      elif not humanList.has_key(tempName) and not botList.has_key(tempName):
        PrivateSend("#2084", "The entity " + tempName + " is unregistered.")
        if unregisteredList.has_key(tempName):
          if unregisteredList[tempName] == "warning":
            PrivateSend("#2084", key + " has been warned before for not registering. " + key + " has therefore been kicked.")
            irc.send('KICK ' + " " + "#2084" + " " + tempName + " :" 'not registered' + '\r\n')
            del unregisteredList[tempName]

        unregisteredList[tempName] = "warning"

  if data.lower().find ('time left') != -1:
    PrivateSend("#2084", str(800 - (time.time() - startTime)).split(".")[0] + " seconds left before purge.")



  if data.find('#') != -1 and data.find("PRIVMSG") == -1 and data.find(botName) != -1 and listRequest == 1 and data.find("JOIN") == -1:
    print("FOUNDLIST")
    print(data)
    tempChannelList = []
    tempChannelList = data.split("\n")
    Send("Deploying bots.")
    for channel in tempChannelList:
      if channel.find('#') != -1:
        print(channel)
        tempChannel = channel
        tempChannel = tempChannel.split('#')[1]
        tempChannel = tempChannel.split(' ')[0]
        if not humanBotList.has_key(str(tempChannel)):
          print(tempChannel)
          botCount = len(humanBotList)
          with open('humanbotlist.txt', 'wb') as handle:
            pickle.dump(humanBotList, handle)
          with open(str(botCount) + '.txt', 'wb') as handle:
            pickle.dump(alwaysEmpty, handle)
          print ("python /home/demure/web/agentbot.py " + str(botCount) + " " + str(tempChannel) + " &" )
          os.system("python /home/demure/web/agentbot.py " + str(botCount) + " " + str(tempChannel) + " &" )
          humanList["Alpha60Agent" + str(botCount)] = "Agent"
          humanBotList[str(tempChannel)] = str(botCount)
        else:
            print("REPEATBOT")
            print(tempChannel)
            os.system("python /home/demure/web/agentbot.py " + str(humanBotList[str(tempChannel)]) + " " + str(tempChannel) + " &" )
            humanList["Alpha60Agent" + str(botCount)] = "Agent"




  if data.find ( 'PRIVMSG ' + botName ) != -1:
    if GetText(data).find(" ") == -1 and GetText(data).find("#") == -1 and GetText(data).find(":") == -1 and GetText(data).find(".") == -1 and not humanList.has_key(GetNick(data)):
      nick = GetNick(data)
      PrivateSend(nick, "Thank you, " + nick +". You have been registered as " + GetText(data) +".")
      PrivateSend(nick, "You have been given a voice.")
      PrivateSend(nick, "You may now continue to #2084")
      Voice(nick, "#2084")
      PrivateSend("#2084", nick + ' Has been registered as the human "' + GetText(data) +'", and has been given a voice.')
      Notice(nick, "Any robotic or suspicious behaviour will be monitored.")
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
      RemoveRight("#2084", botList)
      RestoreRight("#2084", humanList)

    if data.find('#r ') != -1:
      PrivateSend("#2084", GetText(data).replace("#r ", ""))
      print(GetText(data).replace("#r ", ""))

    if data.find('#exit') != -1:
      os.system("pkill python")
      sys.exit("Terminated through private command")



    if data.find('#trigger') != -1:
      Send("Commencing bot test...")
      for trigger in finalTriggerMessage:
        if trigger.find('example') != -1:
          SendLess(finalTriggerMessage[trigger])


    if data.find('#list') != -1:
      List()
      listRequest = 1


    if data.find('#p_') != -1:
      tempData = GetText(data).replace("#p", "")
      PrivateSend(tempData.split("_")[1], tempData.split("_")[2])

    if data.find('#p_') != -1:
      tempData = GetText(data).replace("#p", "")
      PrivateSend(tempData.split("_")[1], tempData.split("_")[2])

    if data.find('#purge') != -1:
      unregisteredList = UnregisterCheck(unregisteredList)
      unregisteredList = DeleteCheck(unregisteredList)
      WriteList(humanList, botList, unregisteredList)
      print(unregisteredList)

    if data.find('#time') != -1:
      PrivateSend("Demure", str(400 - (time.time() - startTime)).split(".")[0] + " seconds left before purge.")



  if data != -1 and data.find('botnet') == -1: 
    nick = GetNick(data)
    print(nick)


    



    if len(textCheck) > 15:
      textCheck.insert(0, GetText(data))
      textCheck.pop()
      if textCheck.count(GetText(data)) > 4:

        if nick != botName and nick != "Demure":
          if not botList.has_key(nick):
            Send("The entity " + nick +" has been registed as a bot.")
            DeOp(nick, "#2084")
            DeVoice(nick, "#2084")
            textCheck = []
            botList[nick] = "true"
            if nick in humanList:
              del humanList[nick]
              Send("It's human rights and voice have been revoked.")
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
          Send("This is a warning for " + nick +". Stop spamming.")
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
          Send("You have been warned, " + nick +". Goodbye.")
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
        PrivateSend("#2084", "Rights have changed to specific entities without my consent. This event has been logged.")



    if action == 'JOIN':
      Host = GetHost(data)
      status = readAdmin(Host)
      if status == 1:
        chan = GetChannel(data)
        nick = GetNick(data)
        if nick != botName and nick != "Demure" and nick.lower().find("bot") == -1 and not botList.has_key(nick) and not humanList.has_key(nick) and nick.find("Alpha60Agent") == -1:
          PrivateSend("#2084", "An unidentified entity logged as " + nick + " has joined the channel.")
          unregisteredList[nick] = "true"
          WriteList(humanList, botList, unregisteredList)
          PrivateSend(nick, "~~~~~~~~~~~~~~~~~~~~~~~~~~")
          PrivateSend(nick, "| Welcome to 2084, " + nick +".")
          PrivateSend(nick, "| Our system is pre-dominantly populated by bots. To gain human rights,")
          PrivateSend(nick, "| please validate your existence by writing your real name, without spaces, in this private conversation.")
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


        elif humanList.has_key(nick) and nick != botName:
          PrivateSend("#2084", "Welcome back, " + nick +". Your rights have been restored.")
          Voice(nick, "#2084")
          Notice(nick, "Any robotic or suspicious behaviour will be monitored.")
        elif nick == botName:
          PrivateSend(homechan, "Alpha60 is now active in " + homechan +". Be rational.")
        elif nick.find("Alpha60Agent"):
          Send("An agent has joined our channel.")
          humanList[nick] = "Agent"



    if action == 'NICK':
      Host = GetHost(data)
      status = readAdmin(Host)
      if status == 1:
        chan = GetChannel(data)
        nick = GetText(data)
        oldNick = GetNick(data)
        if nick != botName and nick != "Demure" and nick.lower().find("bot") == -1 and not botList.has_key(nick) and not humanList.has_key(nick):
          PrivateSend("#2084", "The entity formerly known as " + oldNick + " has been renamed to " + nick + ".")
          unregisteredList[nick] = "true"
          WriteList(humanList, botList, unregisteredList)
          DeOp(nick, homechan)
          DeVoice(nick, homechan)
          PrivateSend(nick, "~~~~~~~~~~~~~~~~~~~~~~~~~~")
          PrivateSend(nick, "| Welcome to 2084, " + nick +".")
          PrivateSend(nick, "| Our system is pre-dominantly populated by bots. To gain human rights,")
          PrivateSend(nick, "| please validate your existence by writing your real name, without spaces, in this private conversation.")
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


        elif humanList.has_key(nick) and nick != botName:
          PrivateSend("#2084", "Welcome back, " + nick +". Your rights have been restored.")
          Voice(nick, "#2084")
          Notice(nick, "Any robotic or suspicious behaviour will be monitored.")
        elif nick == botName:
          PrivateSend(homechan, "Alpha60 is now active in " + homechan +". Be rational.")
