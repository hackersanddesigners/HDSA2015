#! /usr/bin/env python
#
# Example program using irc.client.
#
# This program is free without restrictions; do anything you like with
# it.
#
# Joel Rosdahl <joel@rosdahl.net>

import irc.bot
import os
import struct
import sys
from Queue import Queue
import struct
import time
# import thread
from threading import Thread, Event


# hmm, a bug in bot.py: PATCH ?!
irc.client.VERSION = [str(x) for x in irc.client.VERSION]

def chunks(l, n):
    """ Yield successive n-sized chunks from l.
    """
    for i in xrange(0, len(l), n):
        yield l[i:i+n]

class OutputManager(Thread):
  def __init__(self, connection, delay=.5):
    Thread.__init__(self)
    self.setDaemon(1)
    self.connection = connection
    self.delay = delay
    self.event = Event()
    self.queue = []

  def run(self):
    while 1:
      self.event.wait()
      while self.queue:
        msg,target = self.queue.pop(0)
        self.connection.privmsg(target, msg)
        time.sleep(self.delay)
      self.event.clear()

  def send(self, msg, target):
    self.queue.append((msg.strip(),target))
    self.event.set()

def utf8bytes (x):
    if (type(x) == unicode):
        x = x.encode("utf-8")
    return x

class FileGetBot(irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel
        self.relay_thread_id = None

        self.queue = OutputManager(self.connection)
        self.queue.start()
        self.nickname = nickname
        self.received_bytes = 0

    def on_welcome(self, c, e):
        c.join(self.channel)

    def send_file (self, receiver, filename):
        self.receiver = receiver
        self.filename = filename
        self.filesize = os.path.getsize(self.filename)
        self.file = open(filename)
        print "send_file", filename, self.filesize
        self.sent_bytes = 0
        self.dcc = self.dcc_listen("raw")
        self.connection.ctcp("DCC", self.receiver, "SEND %s %s %d %d" % (
            os.path.basename(self.filename),
            irc.client.ip_quad_to_numstr(self.dcc.localaddress),
            self.dcc.localport,
            self.filesize))

    def on_pubmsg(self, c, e):
        #e.target #deptofreading
        #e.source automatist1!~murtaugh@109.128.217.249
        #e.arguments [u'goo']
        #e.type pubmsg
        # print "pubmsg", dir(e)
        # print e.arguments
        msg = e.arguments[0]
        words = msg.split()
        if words[0] == "get":
            path = words[1]
            if os.path.exists(path):
                receiver = e.source.split("!")[0]
                self.say_public(u"Sending {0} to {1}".format(path, e.source))
                self.send_file(receiver, path)
            else:
                self.say_public(u"File not found '{0}'".format(path))
        elif words[0] == "montage":
            os.system("./montage.sh montage.png")
            receiver = e.source.split("!")[0]
            path = "montage.png"
            self.say_public(u"Sending {0} to {1}".format(path, receiver))
            self.send_file(receiver, path)
        return

    def on_dcc_connect(self, connection, event):
        print "dcc connect"
        if self.filesize == 0:
            self.dcc.disconnect()
            return
        self.send_chunk()

    def on_dcc_disconnect(self, connection, event):
        print "Sent file %s (%d bytes)." % (self.filename, self.filesize)
        # self.connection.quit()

    def on_dccmsg(self, connection, event):
        print "dccmsg"
        acked = struct.unpack("!I", event.arguments[0])[0]
        if acked == self.filesize:
            self.dcc.disconnect()
            # self.connection.quit()
        elif acked == self.sent_bytes:
            self.send_chunk()

    def on_disconnect(self, connection, event):
        print "disconnect"
        # sys.exit(0)

    def on_nosuchnick(self, connection, event):
        print "No such nickname:", event.arguments[0]
        # self.connection.quit()

    def send_chunk(self):
        data = self.file.read(1024)
        self.dcc.privmsg(data)
        self.sent_bytes = self.sent_bytes + len(data)

    def say_public(self, text):
        "Print TEXT into public channel, for all to see."
        for c in chunks(text, 400):
            self.queue.send(c, self.channel)

    def say_private(self, nick, text):
        "Send private message of TEXT to NICK."
        for c in chunks(text, 400):
            self.queue.send(c, nick)

def main():
    import sys
    if len(sys.argv) != 4:
        print "Usage: filegetbot.py <server[:port]> <channel> <nickname>"
        sys.exit(1)

    s = sys.argv[1].split(":", 1)
    server = s[0]
    if len(s) == 2:
        try:
            port = int(s[1])
        except ValueError:
            print "Error: Erroneous port."
            sys.exit(1)
    else:
        port = 6667
    channel = sys.argv[2]
    nickname = sys.argv[3]
    bot = FileGetBot(channel, nickname, server, port)
    bot.start()
        
if __name__ == "__main__":
    main()

