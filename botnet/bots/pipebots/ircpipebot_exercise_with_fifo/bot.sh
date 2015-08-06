mkfifo bot
cat bot | \
    python -u ircpipebot.py --server irc.freenode.net --channel "#botopera" --nickname jaracA | \
    python -u filter.py | \
    python -u upper.py > bot 
rm bot

## botnet.local
## channel #botnet
