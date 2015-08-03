mkfifo bot
cat bot | \
    python -u ircpipebot.py --server botnet.local --channel "#botnet" --nickname virginia | \
    python -u filter_with_text.py | \
    python -u speak.py > bot 
rm bot


