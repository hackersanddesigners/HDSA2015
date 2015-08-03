mkfifo bot
cat bot | \
    python -u ircpipebot.py --server botnet.local --channel "#botnet" --nickname dictionaryBot | \
    python -u filter_with_text.py > bot 
rm bot


