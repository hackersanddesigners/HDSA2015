#! /usr/bin/env python
from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
import SocketServer
import ssl
import urlparse

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

def post(bot):
  c = bot.connection
  channel = bot.channel
  while True:
    time.sleep(60)
    print "MSG TO:", channel
    msg = ard.read(ard.inWaiting())
    print msg
    c.notice(channel, msg)

class TestBot(irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel

    def on_nicknameinuse(self, c, e):
        c.nick(c.get_nickname() + "_")

    def on_welcome(self, c, e):
        c.join(self.channel)

    def on_privmsg(self, c, e):
        self.do_command(e, e.arguments[0])

    def on_pubmsg(self, c, e):
        a = e.arguments[0].split(":", 1)
        if len(a) > 1 and irc.strings.lower(a[0]) == irc.strings.lower(self.connection.get_nickname()):
            self.do_command(e, a[1].strip())
        return

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
    if len(sys.argv) != 4:
        print("Usage: testbot <server[:port]> <channel> <nickname>")
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

    #t = threading.Thread(target=post, args=(bot,))
    #t.daemon = True
    #t.start()

    t = threading.Thread(target=run_server, args=(bot,))
    t.daemon = True
    t.start()

    bot.start()

class S(BaseHTTPRequestHandler):
    def _set_headers(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_GET(self):
        self._set_headers()
        f = open('./' + self.path)
        try:
          self.wfile.write(f.read())
          f.close()
          return
        except IOError:
          self.send_error(404, 'file not found')

    def do_HEAD(self):
        self._set_headers()

    def do_POST(self):
        print dir(self)
        # Extract and print the contents of the POST
        length = int(self.headers['Content-Length'])
        post_data = urlparse.parse_qs(self.rfile.read(length).decode('utf-8'))
        for key, value in post_data.iteritems():
            print "%s=%s" % (key, value)
            c = self.server.bot.connection
            channel = self.server.bot.channel
            print "MSG TO:", channel, value
            c.notice(channel, unicode(value[0]))
            
        # Doesn't do anything with posted data
        self._set_headers()
        self.wfile.write("<html><body><h1>POST!</h1></body></html>")

def run_server(bot, server_class=HTTPServer, handler_class=S, port=443):
    print bot
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    httpd.bot = bot
    print httpd.bot
    httpd.socket = ssl.wrap_socket (httpd.socket, certfile='./77867815_localhost.pem', server_side=True)
    print 'Starting httpd...'
    httpd.serve_forever()
    
if __name__ == "__main__":
    main()

