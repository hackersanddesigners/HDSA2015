Configuring an OpenWRT to an existing wireless network + serve as a hotspot
===================================================================================

Starting from a vanilla openwrt.

Following [this tutorial on setting up a wireless hotspot](http://www.ediy.com.my/index.php/blog/item/110-setting-up-a-wireless-hotspot-using-tp-link-tl-mr3020-wireless-n-router), I connected my laptop to the OpenWRT using an ethernet cable, set my wireless settings to Manual 192.168.1.10 / 255.255.255.0 and cleared the gateway & DNS etc to be blank (Clearing the gateway setting is important if you don't want to interfere with your own wifi connection).

Using the web interface, I navigated to Network -> Wifi, and pressed the SCAN button to find my wifi network.
Once found, I entered a password under Wireless Security and left all other options default. (The Network setting remains on wwan (empty)).

After clicking "Save & Apply". I then tested the internet connection via the patch cable. In this case I needed to turn *off* my wifi connection and then add 192.168.1.1 as both gateway *and* DNS in my wired ethernet settings. (Without setting this, the connection was not working).

Once confirmed that this was working, I returned to the web interface, returned to Network -> Wifi and clicked ADD.
Under ESSID, I changed the default "OpenWrt" to "botnet". Ensured that the mode was set to "Access Point", and selected "lan" as the network.

After clicking "Save & Apply". I then cut off my wired connection and restarted my wifi, selecting the network "botnet". After a bit of time, it joined the network and internet was working!

NB: According to the original tutorial, what *is* important is to make sure that the OpenWRT network is not in the same subnet as the external wireless. So it might be better to use something less standard than 192.168.1.1 which may well be the subnet of a wireless network.


A look at the resulting files:

/etc/config/network
----------------------
	config interface 'loopback'
	      option ifname 'lo'
	      option proto 'static'
	      option ipaddr '127.0.0.1'
	      option netmask '255.0.0.0'

	config interface 'lan'
	      option ifname 'eth0'
	      option type 'bridge'
	      option proto 'static'
	      option ipaddr '192.168.1.1'
	      option netmask '255.255.255.0'

	config interface 'wwan'
	      option proto 'dhcp'

/etc/config/wireless
------------------------------
	config wifi-device 'radio0'
	      option type 'mac80211'
	      option macaddr 'e8:94:f6:ba:f6:74'
	      option hwmode '11ng'
	      option htmode 'HT20'
	      list ht_capab 'SHORT-GI-20'
	      list ht_capab 'SHORT-GI-40'
	      list ht_capab 'RX-STBC1'
	      list ht_capab 'DSSS_CCK-40'
	      option disabled '0'
	      option channel '1'
	      option txpower '27'
	      option country 'US'

	config wifi-iface
	      option network 'wwan'
	      option ssid 'Nam June Paik'
	      option encryption 'psk2'
	      option device 'radio0'
	      option mode 'sta'
	      option bssid '08:96:D7:92:6F:64'
	      option key 'CharlotteMoorman'

	config wifi-iface
	      option device 'radio0'
	      option mode 'ap'
	      option encryption 'none'
	      option ssid 'botnet'
	      option network 'lan'

As far as I know dhcp is still the factory settings...

/etc/config/dhcp
-----------------------
	config dnsmasq
	      option domainneeded     1
	      option boguspriv        1
	      option filterwin2k      0  # enable for dial on demand
	      option localise_queries 1
	      option rebind_protection 1  # disable if upstream must serve RFC1918 addresses
	      option rebind_localhost 1  # enable for RBL checking and similar services
	      #list rebind_domain example.lan  # whitelist RFC1918 responses for domains
	      option local    '/lan/'
	      option domain   'lan'
	      option expandhosts      1
	      option nonegcache       0
	      option authoritative    1
	      option readethers       1
	      option leasefile        '/tmp/dhcp.leases'
	      option resolvfile       '/tmp/resolv.conf.auto'
	      #list server            '/mycompany.local/1.2.3.4'
	      #option nonwildcard     1
	      #list interface         br-lan
	      #list notinterface      lo
	      #list bogusnxdomain     '64.94.110.11'

	config dhcp lan
	      option interface        lan
	      option start    100
	      option limit    150
	      option leasetime        12h

	config dhcp wan
	      option interface        wan
	      option ignore   1


Changing Network
------------------
In a new location, it's necessary to reset the settings to match the new wireless network.

For some reason, it doesn't seem possible to change the settings, so instead I just use the web interface to drop the previous networks and then start again with Scan... for the new one, then add "botnet" as Access Point (on "lan").



