#!/user/bin/env bash

if [ $UID -ne 0]; then
	echo Non root user!
else
	
	#Update everything
	apt-get update && apt-get -y upgrade && apt-get clean

	#Install command line tools
	apt-get -y install htop lynx irssi screen tmux wicd-config aptitude mc nmap wget ssh ssh-server

	#Install command line games
	apt-get install zangband ADOM nethack bombardier tome

	#install samaba
	apt-get install cifs-utils samaba-common-bin

	#Install command line coding tools
	apt-get -y install git valgrind python-rpi.gpio

	#install c programming
	apt-get -y install build-essential libedit-dev manpages-dev

	#install C# programming
	apt-get -y install mono-complete mono-develop

	#install haskell
	#apt-get -y install ghc cabal-install
	#cabal update
	#cabal install vector statistics attoparsec criterion

	#install ruby
	apt-get install ruby ruby1.9.1-dev libsqllite3-dev
	gem install sinatra haml slim rails shotgun pry
	#install gems for fuzzyl's stuff
	gem install git json redcarpet

	#install lamp
	apt-get install apache2 php5 mysql-client mysql-server phpmyadmin

	#install node
	wget http://node-arm.herokuapp.com/node_latest_armhf.deb
	sudo dpkg -i node_latest_armhf.deb
	rm node_latest_armhf.deb
	npm -g install azure-cli express bower

	#install desktop apps
	apt-get -y install iceweasel geany remmina remmina-plugin-rdp evince zenmap

fi

#todo: append iceweasel to autostart
