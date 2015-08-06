from random import choice
import os
import irc.bot
import random
from thread import start_new_thread
from time import sleep
import time


MAX_CONVERSATION_TIME = 40 + random.random()*5
MAX_CONVERSATION_THREAD = 3
MAX_CONSECUTIVE_BOT_MSGS = 4
DEFAULT_RESPONSE_TIME = 5 + random.random()*4

class BotState (object):
    def __init__(self, bot):
        self.bot = bot
        self.active = False

    def enter (self):
        # print "entering", self
        if self.bot.state:
            self.bot.state.exit()
        self.bot.state = self
        self.enter_time = time.time()
        self.state_time = 0
        self.active = True

    def message (self, c, e):
        pass

    def idle (self):
        self.state_time = time.time() - self.enter_time

    def exit (self):
        self.exit_time = time.time()
        self.active = False


##############################################################

class Silence (BotState):
    def enter (self):
        print "Waiting"
        BotState.enter(self)
        self.bot.conversation_count = 0

    def message (self, c, e):
        BotState.message(self, c, e)
        self.bot.conversation_offer.enter()

class ConversationOffer (BotState):
    def enter (self):
        BotState.enter(self)
        self.bot.conversation_count += 1 ### maybe only count times THIS bot responds in the curent run
        print "Conversation Offer"

    def idle (self):
        BotState.idle(self)
        if (self.state_time > self.bot.response_time):
            self.bot.maybe_speak.enter()

    def message (self, c, e):
        BotState.message(self, c, e)
        # "re-enter" the state to reset the idle time
        self.bot.conversation_offer.enter()

class MaybeSpeak (BotState):
    def enter (self):
        print "Maybe Speak"
        BotState.enter(self)

        # if (MAX_CONVERSATION_TIME and time.time() - self.bot.waiting.exit_time) > MAX_CONVERSATION_TIME)
        #     self.bot.conversation_declined.enter()
        #     return

        # if (self.bot.conversation_count > MAX_CONVERSATION_THREAD):
        #     self.bot.conversation_declined.enter()
        #     return
        if (self.bot.consecutive_bot_messages >= MAX_CONSECUTIVE_BOT_MSGS):
            self.bot.conversation_declined.enter()
            return


        c, e = self.bot.last_msg
        msg = e.arguments[0]
        response = self.bot.conversation_callback(msg)
        if response:
            self.bot.say(c, response)
            self.bot.conversation_replied.enter()
        else:
            self.bot.conversation_declined.enter()

class ConversationReplied (BotState):
    def enter (self):
        print "Conversation Replied"
        BotState.enter(self)

    def idle (self):
        BotState.idle(self)
        if self.state_time > self.bot.response_time*2.5:
            self.bot.silence.enter()

    def message (self, c, e):
        BotState.message(self, c, e)
        self.bot.conversation_offer.enter()

class ConversationDeclined (BotState):
    def enter (self):
        print "Conversation Declined"
        BotState.enter(self)

    def idle (self):
        BotState.idle(self)
        if self.state_time > self.bot.response_time*2.5:
            self.bot.silence.enter()

    def message (self, c, e):
        BotState.message(self, c, e)
        self.bot.conversation_offer.enter()

#####

def chunks(l, n):
    """ Yield successive n-sized chunks from l.
    """
    for i in xrange(0, len(l), n):
        yield l[i:i+n]

def nick (src):
    if "!" in src:
        return src.split("!", 1)[0]
    else:
        return src

class ConversationBot(irc.bot.SingleServerIRCBot):
    def __init__(self, channel, nickname, server, conversation_callback, port=6667):
        print "Bot init", server, port, channel
        irc.bot.SingleServerIRCBot.__init__(self, [(server, port)], nickname, nickname)
        self.channel = channel
        self.conversation_callback = conversation_callback
        self.response_time = DEFAULT_RESPONSE_TIME
        self.state = None
        self.consecutive_bot_messages = 0

        self.silence = Silence(self)
        self.conversation_offer = ConversationOffer(self)
        self.conversation_replied = ConversationReplied(self)
        self.conversation_declined = ConversationDeclined(self)
        self.maybe_speak = MaybeSpeak(self)

        self.silence.enter()
        start_new_thread(self.idle_thread, ())


    def idle_thread (self):
        # print "Whoosh.idle_thread", self
        while True:
            self.state.idle()
            # now = time.time()
            # # print "tick"
            # if self.in_conversation:
            #     if not self.gap_fired and self.last_msg_time and (now - self.last_msg_time) > self.gap_time:
            #         self.gap_fired = True
            #         self.on_gap(self.last_msg[0], self.last_msg[1])

            sleep(0.25)


    def on_welcome(self, c, e):
        c.join(self.channel)
        print "join"
        
    def on_privmsg(self, c, e):
        pass

    def say(self, c, msg):
        self.last_spoke_time = time.time()
        for part in chunks(msg, 400):
            c.privmsg(self.channel, part)

    def on_pubmsg(self, c, e):
        # print e.arguments, e.target, e.source, e.arguments, e.type
        self.last_msg = (c, e)
        # print e.target, e.type
        n = nick(e.source)
        if "bot" in n:
            self.consecutive_bot_messages += 1
        else:
            self.consecutive_bot_messages = 0
        self.state.message(c, e)
        # self.last_msg_time = time.time()
        # self.gap_fired = False

    # def on_gap (self, c, e):
    #     print "gap", c, e
        # if self.last_msg:
            # msg = e.arguments[0]
            # search_results = index_search(self.index, msg)
            # """ Remember texts that have already been spoken and cycle through them """
            # if len(search_results) > 0:
            #     r = random.choice(search_results)
            #     self.say(c, u"{0} ({1})".format(r['text'], r['_score']))
        


if __name__ == "__main__":

    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("--index", default="index")
    parser.add_argument("--sentences", default=None)
    parser.add_argument("--search", default=None)

    parser.add_argument('--server', default='localhost', help='server hostname (default: irc.freenode.net)')
    parser.add_argument('--port', default=6667, type=int, help='server port (default: 6667)')
    parser.add_argument('--channel', default='#botopera', help='channel to join (default: #botopera)')
    parser.add_argument('--nickname', default='whooshbot', help='bot nickname (default: botoperahost)')

    args = parser.parse_args()

    if args.sentences:
        ix = get_or_create_index(args.index, schema)
        with open(args.sentences) as f:
            index_sentences(ix, f)
    elif args.search != None:
        ix = open_dir(args.index)
        for r in index_search(ix, args.search):
            print r
    else:
        ix = open_dir(args.index)
        bot = WhooshBot(args.channel, args.nickname, args.server, ix, port=args.port)
        bot.start()

