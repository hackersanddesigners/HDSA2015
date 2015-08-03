mkfifo bot
cat bot | \
    python -u ircpipebot.py --server botnet.local --channel "#botnet" --nickname vocaloidbot | \
    python -u vocaloid.py > bot 
rm bot


