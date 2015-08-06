import irc.bot


def default_welcome (r):
    return u"Welcome to {0}".format(r)

class GuideBot(irc.bot.SingleServerIRCBot):
    def __init__(self, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)

    def on_welcome(self, c, e):
        # print "Bot connected"
        # c.join(self.channel)
        # c.add_global_handler(252, join)
        for channel in rooms:
            c.join(channel)

    def _on_join(self, c, e):
        super(GuideBot, self)._on_join(c, e)
        # print "JOIN", e
        room = e.target
        if room in rooms:
            r = rooms[room]
            c.privmsg(room, r.get('welcome', default_welcome(room)))
            arooms = r.get('adjacent_rooms', [])
            msg = "This room is connected to: {0}".format(" ".join(arooms))
            c.privmsg(room, msg)

if __name__ == "__main__":
    import argparse
    import json

    parser = argparse.ArgumentParser(description='GuideBot')
    parser.add_argument('--rooms', default="guidebot.rooms.json", help='json file to load rooms')
    parser.add_argument('--host', default="relearn", help='host')
    parser.add_argument('--port', type=int, default=6667, help='port')
    parser.add_argument('--nick', default="guidebot", help='bot nickname')
    args = parser.parse_args()
    bot = GuideBot(args.nick, args.host, args.port)
    rooms = json.load(open(args.rooms))
    bot.start()

