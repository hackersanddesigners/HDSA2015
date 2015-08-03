#! /usr/bin/env python

import irc.bot
import irc.strings
from irc.client import ip_numstr_to_quad, ip_quad_to_numstr

import serial
import syslog
import threading
import time

# Init Arduino - JBG
#port = '/dev/cu.usbmodem1411'
#ard = serial.Serial(port,9600,timeout=5)
#time.sleep(2) # wait for Arduino

#content = None
#fname = "./cleanbox"
#with open(fname) as f:
#    content = f.readlines()

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
  


class TestBot(irc.bot.SingleServerIRCBot):
    friend = None
    count = 0 
    def __init__(self, channel, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel

    def on_nicknameinuse(self, c, e):
        c.nick(c.get_nickname() + "_")

    def on_welcome(self, c, e):
        c.join(self.channel)

    def on_privmsg(self, c, e):
        c = self.connection
        msg = e.arguments[0]
        print msg
        msg = nameSwap(msg, e.source.nick)
        if msg != None:
          msg.strip()
          c.notice(self.channel, msg)

        #print e.arguments[0]
        #self.do_command(e, e.arguments[0])
        #nick = e.source.nick
        #msg = content[self.count % len(content)]
        #msg = msg.strip()
        #print self.friend, msg
        #c.notice(self.friend, msg) 
        #self.count += 1
        #time.sleep(1)

    def on_pubmsg(self, c, e):
        a = e.arguments[0].split(":", 1)[0]
        #if len(a) > 1 and irc.strings.lower(a[0]) == irc.strings.lower(self.connection.get_nickname()):
        c = self.connection
        msg = a 
        print msg
        msg = nameSwap(msg, e.source.nick)
        if msg != None:
          msg.strip()
          c.notice(self.channel, msg)

    def on_dccmsg(self, c, e):
        # non-chat DCC messages are raw bytes; decode as text
        text = e.arguments[0].decode('utf-8')
        c.privmsg("You said: " + text)

    def on_dccchat(self, c, e):
        if len(e.arguments) != 2:
            return
        args = e.arguments[1].split()
        if len(args) == 4:
            try:
                address = ip_numstr_to_quad(args[2])
                port = int(args[3])
            except ValueError:
                return
            self.dcc_connect(address, port)

    def do_command(self, e, cmd):
        nick = e.source.nick
        c = self.connection

        if cmd == "disconnect":
            self.disconnect()
        elif cmd == "die":
            self.die()
        elif cmd == "stats":
            for chname, chobj in self.channels.items():
                c.notice(nick, "--- Channel statistics ---")
                c.notice(nick, "Channel: " + chname)
                users = sorted(chobj.users())
                c.notice(nick, "Users: " + ", ".join(users))
                opers = sorted(chobj.opers())
                c.notice(nick, "Opers: " + ", ".join(opers))
                voiced = sorted(chobj.voiced())
                c.notice(nick, "Voiced: " + ", ".join(voiced))
        elif cmd == "dcc":
            dcc = self.dcc_listen()
            c.ctcp("DCC", nick, "CHAT chat %s %d" % (
                ip_quad_to_numstr(dcc.localaddress),
                dcc.localport))
        else:
            c.notice(nick, "Not understood: " + cmd)

def main():
    import sys
    if len(sys.argv) < 4 or len(sys.argv) > 5:
        print("Usage: testbot <server[:port]> <channel> <nickname> <friend>")
        sys.exit(1)

    s = sys.argv[1].split(":", 1)
    server = s[0]
    if len(s) == 2:
        try:
            port = int(s[1])
        except ValueError:
            print("Error: Erroneous port.")
            sys.exit(1)
    else:
        port = 6667
    channel = sys.argv[2]
    nickname = sys.argv[3]
    bot = TestBot(channel, nickname, server, port)
    print "NICK", nickname 

    bot.start()
    
if __name__ == "__main__":
    main()

