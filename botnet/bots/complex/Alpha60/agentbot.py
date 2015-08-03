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
print(sys.argv)
homechan = "#" + str(sys.argv[2])
justChannel = str(sys.argv[2])
irc = socket.socket ( socket.AF_INET, socket.SOCK_STREAM )
irc.connect ( ( network, port ) )
#print irc.recv ( 4096 )
botName = "Alpha60Agent" + str(sys.argv[1])
botColor = "13,14"
botNumber = str(sys.argv[1])


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
        time.sleep(0.4)
        tempMessage = tempMessage + " " + key
  PrivateSend("#2084", "Rights have been restored to the following humans:")
  PrivateSend("#2084", tempMessage)


def RemoveRight(chan, dictlist):
  tempMessage = ""
  if not is_empty(dictlist):
    for key in dictlist:
      if key.find("botnet") == -1: 
        DeVoice(key, "#2084")
        time.sleep(0.4)
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

listOfChat = {}
with open(str(botNumber) + '.txt', 'rb') as handle:
  listOfChat = pickle.loads(handle.read())

#------------------------------------------------------------------------------#


while True:
  action = 'none'
  data = irc.recv ( 4096 ) 
  #print data

  if data.find ( 'PRIVMSG' ) != -1 and data.find('botnet') == -1:
    if listOfChat.has_key(GetNick(data)):
      listOfChat[GetNick(data)] = listOfChat[GetNick(data)] + "[&&&]" + GetText(data) + "[%%]" + str(time.time())
      print("SV: " + GetNick(data) + " : " +  GetText(data))
      with open(str(botNumber) + '.txt', 'wb') as handle:
        pickle.dump(listOfChat, handle)
    else:
      listOfChat[GetNick(data)] = GetText(data)
      with open(str(botNumber) + '.txt', 'wb') as handle:
        pickle.dump(listOfChat, handle)
      print("SV: " + GetNick(data) + " : " +  GetText(data))




#------------------------------------------------------------------------------#

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

    

 #   if action == 'JOIN':
  #    if data.find(botName) != -1:
   #     Send(botName + " has been activated on " + homechan + ". Please stay rational.")