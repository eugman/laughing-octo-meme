#! /bin/bash

if [[ $UID -ne 0 ]]
then
	echo Non root user!
	exit 1
fi

while [[ $pi != 'y' && $pi != 'n' ]]
do
	echo "Is this running on a raspberry pi? (y/n)"
	read pi
done

while [[ $debian != 'y' && $debian != 'n' ]]
do
	echo "Is this debian based? (y/n)"
	read debian
done

while [[ $desktop != 'y' && $desktop != 'n' ]]
do
	echo "Do you want to install desktop apps? (y/n)"
	read desktop
done

if [[ $debian = 'y' ]]

	if [[ $pi == 'y' ]]
	then
		#change the keyboard layout
		sed -i 's/XKBLAYOUT="gb"/XKBLAYOUT="us"/' /etc/default/keyboard
	
		#change the clock default and browser default
		sed -i 's@id=/usr/share/raspi-ui-overrides/applications/epiphany-browser.desktop@id=/usr/share/applications/iceweasel.desktop@' /home/pi/.config/lxpanel/LXDE-pi/panels/panel
		sed -i 's/ClockFmt=%R/ClockFmt=%r/' /home/pi/.config/lxpanel/LXDE-pi/panels/panel
	fi
	
	#Update everything
	apt-get update && apt-get -y upgrade && apt-get clean

	#Install command line tools
	apt-get -y install htop lynx irssi screen tmux wicd-curses aptitude mc nmap wget ssh vim

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
	
	if [[ $pi == 'n' ]]
	then
		#install haskell
		apt-get -y install ghc cabal-install
	fi

	#install ruby
	apt-get install ruby ruby1.9.1-dev libsqlite3-dev ri ruby-dev

	#install lamp
	apt-get install apache2 php5 mysql-client mysql-server phpmyadmin

	if [[ $pi == 'y' ]]
	then
		#install node
		wget http://node-arm.herokuapp.com/node_latest_armhf.deb
		sudo dpkg -i node_latest_armhf.deb
		rm node_latest_armhf.deb
	else
		sudo apt-get install nodejs
	fi
	
	#clean again, just to be safe
	apt-get clean

	if [[ $desktop = 'y' ]]
	then
		#install desktop apps
		apt-get -y install iceweasel geany remmina remmina-plugin-rdp evince zenmap
	fi

fi

#todo: append iceweasel to autostart
if [[ $debian == 'n' ]]
then
	#update everything
	yum -y update

	#install command line tools
	yum -y install htop lynx irssi screen tmux mc nmap wget curl

	#install command line coding tools
	yum -y install git valgrind vim

	#install samba
	yum -y install samba samba-client system-config-samba cifs-utils

	#install c tools
	yum -y groupinstall development-tools
	yum -y install libedit-dev* man-pages libstdc++-docs

	#install C# programming
	yum -y install monodevelop monocomplete monodevelop-database monodevelop-versioncontrol

	if [[ $desktop == 'n' ]]
	then
		#install haskell
		yum -y install ghc cabal-install
	fi

	#install ruby
	yum -y install ruby ruby-devel sqlite3-devel

	#install lamp
	yum -y install httpd mysql mysql-server php php-mysql php-myadmin
	service httpd start; service mysql start
	#/user/bin/mysql_secure_installation

	#install mean
	#http://docs.mongodb.org/manual/tutorial/install-mongodb-on-red-hat/
	yum -y install mongodb-org nodejs npm
	service mongod start
	
	if [[ $desktop = 'y']]
	then
		#install desktop apps
		yum -y install eric geany lazarus drpython remmina remmina-plugin-rdp zenmap

		#install a bunch of random stuff, I don't know if any of this works
		yum -y install scala erlang eclipse golang rust clojure dmd ldc gdc
	fi
fi

#install gems
gem install sinatra haml slim rails shotgun pry bundler
#install gems for fuzzyl's stuff
gem install git json redcarpet

#install node packages
npm -g install azure-cli express bower

if [[ $pi == 'n' ]]
then
	cabal update
	cabal install vector statistics attoparsec criterion
fi

exit 0
