import re
import irc.bot

def multiwordReplace(text, wordDic):
			#take a text and replace words that match a key in a dictionary with
			#the associated value, return the changed text
			rc = re.compile('|'.join(map(re.escape, wordDic)))
			def translate(match):
				return wordDic[match.group(0)]
			return rc.sub(translate, text)

class HelloBot(irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, port=6667):
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel

    def on_welcome(self, c, e):
        print "Bot connected"
        c.join(self.channel)

    def on_privmsg(self, c, e):
        self.on_pubmsg(c, e)

    def on_pubmsg(self, c, e):

		str1 = e.arguments[0]

		# the dictionary has target_word : replacement_word pairs
		wordDic = {
		'a': 'was ',
		'A': 'Was ',
		'b': 'the ',
		'B': 'The ',
		'c': 'of ',
		'C': 'Of ',
		'd': 'it ',
		'D': 'It ',
		'e': 'had ',
		'E': 'Had ',
		'f': 'winston ',
		'F': 'Winston ',
		'g': 'his ',
		'G': 'His ',
		'h': 'with ',
		'H': 'With ',
		'i': 'face ',
		'I': 'Face ',
		'j': 'to ',
		'J': 'To ',
		'k': 'for ',
		'K': 'For ',
		'l': 'at ',
		'L': 'At ',
		'm': 'wall ',
		'M': 'Wall ',
		'n': 'a ',
		'N': 'A ',
		'o': 'is ',
		'O': 'Is ',
		'p': 'quickly ',
		'P': 'Quickly ',
		'q': 'on ',
		'Q': 'On ',
		'r': 'you ',
		'R': 'You ',
		's': 'in ',
		'S': 'In ',
		't': 'and ',
		'T': 'And ',
		'u': 'lift ',
		'U': 'Lift ',
		'v': 'one ',
		'V': 'One ',
		'w': 'enormous ',
		'W': 'Enormous ',
		'x': 'from ',
		'X': 'From ',
		'y': 'times ',
		'Y': 'Times ',
		'z': 'an ',
		'Z': 'An ',
		' ': '.  ',
		'.': '!!! '
		}

		# call the function and get the changed text
		str2 = multiwordReplace(str1, wordDic)

		#if str1.find('bot')!=-1:
		c.privmsg(self.channel,str2)


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description='BashBot')
    parser.add_argument('--host', default="localhost", help='host')
    parser.add_argument('--port', type=int, default=6667, help='port')
    parser.add_argument('channel', help='channel to join')
    parser.add_argument('nickname', help='bot nickname')
    args = parser.parse_args()
    if not args.channel.startswith("#"):
        args.channel = "#"+args.channel

    bot = HelloBot(args.channel, args.nickname, args.host, args.port)
    bot.start()