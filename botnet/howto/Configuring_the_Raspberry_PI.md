Configuring the Raspberry PI
=============================

* Expand / reboot (raspi-config)
* Login: pi/raspberry

* sudo raspi-config to set keyboard layout to English (US). (default is UK)
* sudo raspi-config : Advanced to force audio to the headphone jack.

Used the image of 05_05_2015 (need to copy it)
OpenSSH seems to be running by default

avahi-daemon seems already to be installed (Using [.local address](http://www.howtogeek.com/167190/how-and-why-to-assign-the-.local-domain-to-your-raspberry-pi/) on the Pi.)


Network
----------

Configured a static IP address following the [Debian manual](https://wiki.debian.org/NetworkConfiguration#Configuring_the_interface_manually).

sudo nano /etc/network/interfaces
------------------------
#iface eth0 inet manual
iface eth0 inet static
    address 192.168.1.2
    netmask 255.255.255.0
    gateway 192.168.1.1

* Connected to net via cable + did an apt-get update / upgrade.

	sudo nano /etc/hostname

and changed to "botnet"

From now on (restart) you should be able to reach the server at botnet.local, for instance:

	ssh pi@botnet.local




Installing stuff
-------------------
* figlet
* links
* emacs23-nox
* espeak
* festival
* apache2
* ircd-hybrid

Personalizing the server
-------------------------
* /etc/motd
* /var/www/index.html
* /etc/ircd-hybrid/ircd.conf

Raised setting:
number_per_ip from 2 (default) to 50

	class {
	        /* name: the name of the class.  classes are text now */
	       	name = "users";
	        /* ping time: how often a client must reply to a PING from the
	         * server before they are dropped.
	         */
	        ping_time = 2 minutes;
	        /* number per ip: the number of users per host allowed to connect */
	        number_per_ip = 50;
		/* max number: the maximum number of users allowed in this class */
		max_number = 100;
		/* sendq: the amount of data allowed in a clients queue before
	         * they are dropped.
He	         */
	        sendq = 100 kbytes;
	};

AND (it seems important) I added the IP address:

	/* listen {}: contain information about the ports ircd listens on (OLD P:) */
	listen {
	        /* port: the specific port to listen on.  if no host is specified
	         * before, it will listen on all available IPs.
	         *
	         * ports are seperated via a comma, a range may be specified using ".."
		 */

	        /* port: listen on all available IPs, ports 6665 to 6669 */
		host = "0.0.0.0";   # change this!                                                                                              
	        port = 6665 .. 6669;
	};



    sudo /etc/init.d/ircd-hyrbrid restart

After this I could connect with pidgin to botnet.local.


More software
-----------------
* apt-get install ipython python-pip screen mplayer
* sudo pip install irc

Attaching an external USB stick for storage
---------------------------------------------
(Also nice if SD card craps out)

Formatted it ext4 (on laptop).

Created a mount point:

	sudo mkdir /media/GREEN

And edited the fstab, adding a line:

### /etc/fstab
proc            /proc           proc    defaults          0       0
/dev/mmcblk0p1  /boot           vfat    defaults          0       2
/dev/mmcblk0p2  /               ext4    defaults,noatime  0       1
/dev/sda1	/media/GREEN	ext4	defaults,noatime  0	  0	

Then edited the apache default "site" definition, to change location *and* to add a custom header + footer (readme) to the directory listings:

### /etc/apache2/sites-available/default

	<VirtualHost *:80>
		ServerAdmin webmaster@localhost

		## CHANGED
		DocumentRoot   /media/GREEN/www

		<Directory />
			Options FollowSymLinks
			AllowOverride None
		</Directory>

		## CHANGED
		<Directory /media/GREEN/www/>
			Options Indexes FollowSymLinks MultiViews
			AllowOverride None
			Order allow,deny
			allow from all
		</Directory>

		ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
		<Directory "/usr/lib/cgi-bin">
			AllowOverride None
			Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
			Order allow,deny
			Allow from all
		</Directory>

		ErrorLog ${APACHE_LOG_DIR}/error.log

		# Possible values include: debug, info, notice, warn, error, crit,
		# alert, emerg.
		LogLevel warn

		CustomLog ${APACHE_LOG_DIR}/access.log combined

		# CHANGED: CUSTOM listing HEADER + FOOTER
		HeaderName /include/HEADER.html
		ReadmeName /include/README.html

	</VirtualHost>


Auto login (shell)
----------------------

The raspi-config gives options to automatically start up the graphical shell, but you can also login via the console without starting X.

Following [this tutorial](http://raspisimon.no-ip.org/rpi_autologin.php):

	sudo nano /etc/inittab

change

	1:2345:respawn:/sbin/getty 115200 tty1

to

	#1:2345:respawn:/sbin/getty 115200 tty1
	1:2345:respawn:/bin/login -f pi tty1 </dev/tty1 >/dev/tty1 2>&1

Image Viewer
--------------

fbi & fim!


Media
------------
omxplayer, aplay, mplayer ...


Starting something, and stopping it with pid
-----------
In most shells (including Bourne and C), the PID of the last subprocess you launched in the background will be stored in the special variable $!.

	#!/bin/bash
	./app1 &
	PID=$!
	# ...
	kill $PID



fim
-----------


	usleep '0';
	reduce;
	usleep '0';
	reduce;
	usleep '192000';
	reduce;
	usleep '203000';
	reduce;
	usleep '479000';
	reduce;
	usleep '0';
	reduce;
	usleep '566000';
	magnify;
	usleep '0';
	reduce;
	quit;


	cat fimscript | fim -p robby.jpg

or

	fim -p robby.jpg < fimscript

overscan
---------------
/boot/config.txt



Bigger Font
-----------------

[Tutorial](http://www.raspberrypi-spy.co.uk/2014/04/how-to-change-the-command-line-font-size/)

To see a list of available fonts: ls /usr/share/consolefonts/

	setfont /usr/share/consolefonts/Lat15-TerminusBold32x16.psf.gz

sudo nano /etc/default/console-setup
and filled in:

FONTFACE="Terminus"
FONTSIZE="16x32"

