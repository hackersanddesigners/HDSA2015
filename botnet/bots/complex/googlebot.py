import irc.bot
from random import choice
import urllib2, json, urllib
from time import sleep

"""
So Google has a "Web Search" API, which is officially (as of 2010) deprecated.
Fascinating how the space of the "deprecated" api is used to delimit a territory
of actual use (programmatic search results) from a product (the "replacement" of
Custom Search Engines product which only gives 100 results free per day),
and anyway seems to be packaged as only working for a fixed number of sites
(so your site ipv the web in general)

Some sample code on using this deprecated call from python reveals that in fact it's just
an AJAX call:

Interesting that they request that you self-identify your users ip address and url of your site.


import urllib2
import simplejson

# The request also includes the userip parameter which provides the end
# user's IP address. Doing so will help distinguish this legitimate
# server-side traffic from traffic which doesn't come from an end-user.
url = ('https://ajax.googleapis.com/ajax/services/search/web'
       '?v=1.0&q=Paris%20Hilton&userip=USERS-IP-ADDRESS')

request = urllib2.Request(
    url, None, {'Referer': /* Enter the URL of your site here */})
response = urllib2.urlopen(request)

# Process the JSON string.
results = simplejson.load(response)
"""

def search (t, userip='USERS-IP-ADDRESS', referer="http://automatist.net/"):
    url = "https://ajax.googleapis.com/ajax/services/search/web"
    if type(t) == unicode:
        t = t.encode("utf-8")
    url += "?" + urllib.urlencode({'v': '1.0', 'q': t, 'userip': userip})
    request = urllib2.Request(url, None, {'Referer': referer})
    return json.load(urllib2.urlopen(request))

# now have some fun with the results...
tos = {'lines': []}

with open("google_websearchtos.txt") as f:
    start = True
    for line in f:
        line = line.decode("utf-8")
        if start:
            if ":" in line:
                (name, value) = line.split(":", 1)
                tos['name'] = value
            else:
                start = False
        else:
            line = line.strip()
            if line:
                tos['lines'].append(line)


class Bot(irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel

    def on_welcome(self, c, e):
        print "GOOGLEBOT is connected"
        c.join(self.channel)

    def on_privmsg(self, c, e):
        pass

    def on_pubmsg(self, c, e):
        # e.target, e.source, e.arguments, e.type
        msg = e.arguments[0].lower()
        if "google" in msg:
            msg = msg.replace("google", "").strip()
            results = search(msg)
            c.privmsg(self.channel, u'Here are the first 3 search results for "{0}"...'.format(msg))
            for result in results['responseData']['results'][:3]:
                resp = result['content'][:400].replace("\n", " ")
                c.privmsg(self.channel, resp)
            sleep(4)
            msg = u"NB: From my terms of service: "+choice(tos['lines'])[:400]
            c.privmsg(self.channel, msg)


if __name__ == "__main__":
    import sys
    if len(sys.argv) != 4:
        print "Usage: googlebot.py <server[:port]> <channel> <nickname>"
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
    bot = Bot(channel, nickname, server, port)
    bot.start()

