from __future__ import print_function
import irc.bot
import sys, time
from thread import start_new_thread


def chunks(l, n):
    """ Yield successive n-sized chunks from l.
    """
    for i in xrange(0, len(l), n):
        yield l[i:i+n]

class Bot (irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, input, port=6667, idle=False):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.input = input
        self.channel = channel
        if idle:
            start_new_thread(self.idle, ())

    def on_welcome(self, c, e):
        c.join(self.channel)
        print ("join", file=sys.stderr)
        start_new_thread(self.receive, (c,))

    def idle(self):
        while True:
            tstr = time.strftime("%H:%M:%S", time.localtime())
            out = u"({0}) {1}: {2}".format(tstr, "_system", "idle")
            sys.stdout.write(out.encode("utf-8")+"\n")
            sys.stdout.flush()
            time.sleep(1)

    def receive (self, c): 
        if self.input == sys.stdin:
            # print ("reading from stdin", file=sys.stderr)
            _in = sys.stdin
        else:
            # print ("reading from {0}".format(self.input), file=sys.stderr)
            _in = open(self.input)

        while True:
            line = _in.readline()
            if line == '':
                break
            line = line.rstrip().decode("utf-8")
            if line:
                # print ("read line: {0}".format(line), file=sys.stderr)
                # CHUNK IT
                for chunk in chunks(line, 400):
                    c.privmsg(self.channel, chunk)
        
    def on_pubmsg(self, c, e):
        # e.target, e.source, e.arguments, e.type
        msg = e.arguments[0]
        tstr = time.strftime("%H:%M:%S", time.localtime())
        nick = e.source.split("!", 1)[0]
        out = u"({0}) {1}: {2}".format(tstr, nick, msg)
        sys.stdout.write(out.encode("utf-8")+"\n")
        sys.stdout.flush()
        # print ("pubmsg: {0}".format(msg), file=sys.stderr)
        
if __name__ == "__main__":
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument('--server', default='irc.freenode.net', help='server hostname (default: localhost)')
    parser.add_argument('--port', default=6667, type=int, help='server port (default: 6667)')
    parser.add_argument('--channel', default='#botopera', help='channel to join (default: #botopera)')
    parser.add_argument('--nickname', default='pipebot', help='bot nickname (default: pipebot)')
    parser.add_argument('--input', default=sys.stdin, help='input')
    parser.add_argument('--idle', default=False, action="store_true", help='output idle messages')
    args = parser.parse_args()

    bot = Bot(args.channel, args.nickname, args.server, args.input, port=args.port, idle=args.idle)
    bot.start()
