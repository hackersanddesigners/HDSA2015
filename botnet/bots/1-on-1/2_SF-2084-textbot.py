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
        #e.arguments[0]
        nick = e.source.nick
        if nick != 'SF-2084':

            dictionary= {
                'th':'all together',
                'he':'it empowers',
                'an':'results in',
                're':'it will zip',
                'er':'questions questions',
                'in':'loops into',
                'a':'try',
                'b':'where',
                'c':'world',
                'd':'and',
                'e':'personalize',
                'f':'it',
                'g':'how',
                'h':'connection',
                'i':'connect',
                'j':'a',
                'k':'the',
                'l':'people',
                'm':'life',
                'n':'it',
                'o':'love',
                'p':'future',
                'q':'to',
                'r':'network',
                's':'and',
                't':'we',
                'u':'trace',
                'v':'why',
                'w':'as',
                'x':'on',
                'y':'it',
                'z':'why',
                ' ':'.',
                '.':'it ends',
                ',':'a window',
                '!':'enormous',
                '?':'I ask myself if that is really the case',
                '0':'none',
                '1':'the first',
                '2':'the second',
                '3':'the third',
                '4':'the fourth',
                '5':'the fifth',
                '6':'the sixth',
                '7':'the seventh',
                '8':'the eighth',
                '9':'the nineth'
                }

            m = e.arguments[0]
            m = m.lower()
            m = list(m)

            for i in range(len(m)):
                if not dictionary.has_key(m[i]):
                    continue
                m[i]=dictionary[m[i]]
            new = ' '.join(m)
            
            if ' .' in new:
                new = new.replace(' .', '.')
            
            def treatment():
                count = 0
                x = list(new)
                for n in x:
                    if n ==x[0]:
                        x[0] = n.upper()
                    if n == '.' and count+2 < len(x):
                        x[count+2] = x[count+2].upper()
                    count +=1
                printedtext = ''.join(x)[:400]
                return printedtext+'.'
            
            talk = 'Meanwhile in 2084: '+treatment()
            if talk != None:
                c.privmsg(self.channel,talk)
            else:
                c.privmsg(self.channel,new.capitalize()+'.')



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