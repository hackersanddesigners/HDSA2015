from conversationbot import ConversationBot
from whooshutils import index_search, get_or_create_index, index_sentences, open_dir, ConversationCallback


if __name__ == "__main__":

    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("--index", default="index")
    parser.add_argument("--sentences", default=None)
    parser.add_argument("--search", default=None)

    parser.add_argument('--server', default='irc.freenode.net', help='server hostname (default: irc.freenode.net)')
    parser.add_argument('--port', default=6667, type=int, help='server port (default: 6667)')
    parser.add_argument('--channel', default='#botopera', help='channel to join (default: #botopera)')
    parser.add_argument('--nickname', default='botswaller_wikipedia', help='bot nickname (default: botoperahost)')

    args = parser.parse_args()

    if args.sentences:
        ix = get_or_create_index(args.index)
        with open(args.sentences) as f:
            index_sentences(ix, f)

    elif args.search != None:
        ix = get_or_create_index(args.index)
        for r in index_search(ix, args.search):
            print r
    else:
        ix = get_or_create_index(args.index)
        cc = ConversationCallback(ix)
        bot = ConversationBot(args.channel, args.nickname, args.server, cc.callback, port=args.port)
        bot.start()
