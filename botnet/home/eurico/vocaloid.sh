mkfifo voicebot
cat voicebot | \
    python -u ircpipebot.py --server botnet.local --channel "#botnet" --nickname vocaloid | \
    python -u vocaloid.py > voicebot 
rm voicebot