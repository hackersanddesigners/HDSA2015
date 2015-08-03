## Launch a script in terminal

    python ircpipebot.py

## Launch script as a bot in IRC-channel

    python -u ircpipebot.py --server irc.frreenode.net --channel "#botopera" --nickname name_bot

## Log activities of chatbot in file

    python -u ircpipebot.py --server irc.frreenode.net --channel "#botopera" --nickname name_bot > log.txt

## Look at content of file in terminal

    tail -f log.txt

## Send activities chatbot to another program ( this is called a PIPE)

    cat log.txt | python upper.py
    python ircpipebot.py --server botnet.local --channel "#botnet" --nickname jaraco | python -u filter.py 

## Pipe the processed activities back to chat channel

    // save this as chatbot.sh
    mkfifo bot
    cat bot | \
        python -u ircpipebot.py --server irc.freenode.net --channel "#botnet" --nickname jaraco | \
        python -u filter.py | \
        python -u split.py > bot 
    rm bot

    // save this as filter.py
    import sys
    import os
    # infinite loop that keeps reading & responding
    while True:
        zin = sys.stdin.readline()
        if not zin:
            break
        # do something to xform zin to out
        out = zin.strip("\n")
        out = out.split(" ", 2)
        if out[1] == "spam:":
            out = out[-1]
            print(out)

    // save this as split.py
    import sys
    import os
    # infinite loop that keeps reading & responding
    while True:
        zin = sys.stdin.readline()
        if not zin:
            break
        out = zin.upper()
        sys.stdout.write(out)
        os.system("espeak \""+ out.strip() + "\"")
