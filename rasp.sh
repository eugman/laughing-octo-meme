#!/user/bin/env bash

if [ $UID -ne 0 ]; then
	echo Non root user!
else
	
	#change the keyboard layout
	sed -i 's/XKBLAYOUT="gb"/XKBLAYOUT="us"/' /etc/default/keyboard

	#change the clock default and browser default
	sed -i 's@id=/usr/share/raspi-ui-overrides/applications/epiphany-browser.desktop@id=/usr/share/applications/iceweasel.desktop@' /home/pi/.config/lxpanel/LXDE-pi/panels/panel
	sed -i 's/ClockFmt=%R/ClockFmt=%r/' /home/pi/.config/lxpanel/LXDE-pi/panels/panel
	
	#Update everything
	apt-get update && apt-get -y upgrade && apt-get clean

	#Install command line tools
	apt-get -y install htop lynx irssi screen tmux wicd-config aptitude mc nmap wget ssh openssh vim

	#Install command line games
	apt-get -y install nethack-console bombardier

	#install samaba
	apt-get -y install cifs-utils samaba-common-bin

	#Install command line coding tools
	apt-get -y install git valgrind python-rpi.gpio

	#install c programming
	apt-get -y install build-essential libedit-dev manpages-dev
	
	#clean again
	apt-get clean

	#install C# programming
	apt-get -y install mono-complete monodevelop monodevelop-database monodevelop-versioncontrol

	#install haskell
	#apt-get -y install ghc cabal-install
	#cabal update
	#cabal install vector statistics attoparsec criterion

	#install ruby
	apt-get install ruby ruby1.9.1-dev libsqlite3-dev ri ruby-dev
	gem install sinatra haml slim rails shotgun pry bundler
	#install gems for fuzzyl's stuff
	gem install git json redcarpet

	#install lamp
	apt-get install apache2 php5 mysql-client mysql-server phpmyadmin

	#install node
	wget http://node-arm.herokuapp.com/node_latest_armhf.deb
	sudo dpkg -i node_latest_armhf.deb
	rm node_latest_armhf.deb
	npm -g install azure-cli express bower

	#clean again, just to be safe
	apt-get clean

	#install desktop apps
	apt-get -y install iceweasel geany remmina remmina-plugin-rdp evince zenmap

fi

#todo: append iceweasel to autostart
