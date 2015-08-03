## MAC OSX Tools

* chatclient: [Colloquy](/software/colloquy-latest.zip) (OSX Lion + 64-bit Intel Mac): [website](http://colloquy.info)
* ssh & ftp: [Cyberduck](/software/Cyberduck-4.7.1.zip) [website](https://cyberduck.io/)
* editor: [Bluefish](/software/Bluefish-2.2.7.dmg) [website](http://bluefish.openoffice.nl/index.html), or [Sublime Text](/software/Sublime%20Text%202.0.2.dmg) [website](http://www.sublimetext.com/)

## Some links

* [espeak manpages](http://manpages.ubuntu.com/manpages/hardy/man1/espeak.1.html)
    
* [plumbing pipebots](plumbing.html) [2](http://pad.constantvzw.org/public_pad/2084_Rise_of_the_botnet_plumbing)

* [history of IRC](http://daniel.haxx.se/irchistory.html)

* [timeline of the Internet](https://en.wikipedia.org/wiki/History_of_the_Internet)

## Connecting to local network botnet.local

* connect:

    ssh USERNAME@botnet.local

* disconnect
    exit

* copy ssh-key onto Pi
    ssh-copy-id pi@botnet.local

* copy folder-with-content from your own machine onto Pi (make sure you're not logged onto local server + add : ton indicate location)

    scp -r bots pi@botnet.local:

* move folder from home Pi to webserver Pi

    sudo mv bots/ /media/GREEN/www/
