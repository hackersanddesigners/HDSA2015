mkfifo bot
cat bot | \
    python -u ircpipebot.py --server botnet.local --channel "#botnet" --nickname query | \
    python -u query.py | \
    python -u speak.py > bot 
rm bot


