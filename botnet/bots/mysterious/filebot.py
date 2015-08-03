import irc.bot
import time, os
import time
# from time import sleep, time, ctime
from Queue import Queue
import struct
# import thread
from threading import Thread, Event

# LOG = None # open("listener.log", "a")

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

class FileBot(irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel
        self.relay_thread_id = None

        self.queue = OutputManager(self.connection)
        self.queue.start()
        self.nickname = nickname
        self.received_bytes = 0

    def on_nicknameinuse(self, c, e):
        c.nick(c.get_nickname() + "_")

    def on_welcome(self, c, e):
        c.join(self.channel)

    def on_privmsg(self, c, e):
        pass

    def on_pubmsg(self, c, e):
        #e.target #deptofreading
        #e.source automatist1!~murtaugh@109.128.217.249
        #e.arguments [u'goo']
        #e.type pubmsg
        #automatist1 ~murtaugh ~murtaugh@109.128.217.249 109.128.217.249
        chatname = self.channel # could be e.target?!
        print chatname
        return

#         chatsByName[chatname] = self
#         nick = e.source.nick
#         user = e.source.user
#         msg = e.arguments[0]
#         msg = msg.replace(r"\\", r"\\"+"\n")
#         tstamp = int(time.time())
#         responses = addchat(tstamp, chatname, nick, user, msg, self.nickname)
#         for r in responses:
# #            try: 
#             r = r.replace("\n", " ")
#             self.say_public(r)
# ##                    for rl in r.splitlines():
# ##                        self.say_public(rl)
# #            except:
# #                print "An error occured while sending the message to the chat", e

#         interface.message("%s: Sent message from %s" % (ctime(), nick), False)
        

    def on_join(self, c, e):
        print "JOINED"
#        if self.relay_thread_id == None:
#            self.relay_thread_id = thread.start_new_thread(relay_incoming_messages, (self,))

    def say_public(self, text):
        "Print TEXT into public channel, for all to see."
        for c in chunks(text, 400):
            self.queue.send(c, self.channel)

    def say_private(self, nick, text):
        "Send private message of TEXT to NICK."
        for c in chunks(text, 400):
            self.queue.send(c, nick)

    def on_ctcp(self, connection, event):
        args = event.arguments[1].split()
        print "CTCP", args
        if args[0] != "SEND":
            return
        self.filename = os.path.basename(args[1])
        self.filename = self.filename.strip('"')
        if os.path.exists(self.filename):
            print "Warning, a file named", self.filename, "already exists."
            # self.connection.quit()
        self.file = open(self.filename, "wb")
        peeraddress = irc.client.ip_numstr_to_quad(args[2])
        peerport = int(args[3])
        self.dcc = self.dcc_connect(peeraddress, peerport, "raw")

    def on_dccmsg(self, connection, event):
        data = event.arguments[0]
        self.file.write(data)
        self.received_bytes = self.received_bytes + len(data)
        # print "received bytes", type(self.received_bytes)
        # self.dcc.privmsg(struct.pack("!I", self.received_bytes))

    def on_dcc_disconnect(self, connection, event):
        self.file.close()
        print "Received file %s (%d bytes)." % (self.filename,
                                                self.received_bytes)
        self.say_public("Received file %s (%d bytes)." % (self.filename,
                                                self.received_bytes))
        #self.connection.quit()



def main():
    import sys
    if len(sys.argv) != 4:
        print "Usage: filebot.py <server[:port]> <channel> <nickname>"
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

    # thread.start_new_thread(getChatMessagesThread, ())
    bot = FileBot(channel, nickname, server, port)
    bot.start()

# def start(channel, nickname, server, port=6667):
#     # thread.start_new_thread(getChatMessagesThread, ())
#     bot = MyBot(channel, nickname, server, port)
#     while True:
#         print "Starting chatbot"
#         ### ADD BACK
#         try:
#             bot.start()
#         except Exception, e:
#             print "Exception", e
#             print "Restarting bot in 3 seconds..."
#             sleep(3)
        
if __name__ == "__main__":
    main()

