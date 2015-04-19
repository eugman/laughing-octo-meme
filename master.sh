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


	if [[ $pi == 'y' ]]
	then
		#change the keyboard layout
		sed -i 's/XKBLAYOUT="gb"/XKBLAYOUT="us"/' /etc/default/keyboard
	
		#change the clock default and browser default
		sed -i 's@id=/usr/share/raspi-ui-overrides/applications/epiphany-browser.desktop@id=/usr/share/applications/iceweasel.desktop@' /home/pi/.config/lxpanel/LXDE-pi/panels/panel
		sed -i 's/ClockFmt=%R/ClockFmt=%r/' /home/pi/.config/lxpanel/LXDE-pi/panels/panel
	fi
	


if [[ $debian == 'y' ]]
then
	#Update everything
	apt-get update && apt-get -y upgrade && apt-get clean

	#Install command line tools
	apt-get -y install htop lynx irssi screen tmux wicd-curses aptitude mc nmap wget ssh vim scrot

	#Install command line games
	apt-get -y install angband angband-doc crawl gearhead gearhead2 moria omega-rpg bsdgames freesweep gnobots2 zangband-data slashem nethack-console bombardier 

	#install samaba
	apt-get -y install cifs-utils 
	apt-get -y install samaba-common-bin

	#Install command line coding tools
	apt-get -y install git valgrind python-pip
	if [[ $pi == 'y' ]]
	then
		apt-get -y install python-rpi.gpio
	fi

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
	apt-get -y install ruby ruby1.9.1-dev libsqlite3-dev ri ruby-dev

	#install lamp
	apt-get -y install apache2 php5 mysql-client mysql-server phpmyadmin
    
	if [[ $pi == 'y' ]] 
	then
		if ! hash node 2>/dev/null
		then
			#install node
			#todo check if instlaled
			wget http://node-arm.herokuapp.com/node_latest_armhf.deb
			sudo dpkg -i node_latest_armhf.deb
			rm node_latest_armhf.deb
		fi
	else
		sudo apt-get -y install nodejs
		sudo apt-get -y install npm
	fi
	
	#clean again, just to be safe
	apt-get clean

	if [[ $desktop == 'y' ]]
	then
		#install desktop apps
		apt-get -y install iceweasel geany remmina remmina-plugin-rdp evince zenmap gparted
#		if [[ -e /etc/xdg/lxsession/LXDE-pi/autostart && ! grep -q iceweasel /etc/xdg/lxsession/LXDE-pi/autostart ]]	
#		then
#			echo "@iceweasel" >> /etc/xdg/lxsession/LXDE-pi/autostart
#		fi
	fi
fi


if [[ $debian == 'n' ]]
then
	#update everything
	yum -y update

	#install command line tools
	yum -y install htop lynx irssi screen tmux wicd-curses mc nmap wget curl ssh

	#Install command line games
	yum -y install nethack-console bombardier

	#install command line coding tools
	yum -y install git valgrind vim python-pip

	#install samba
	yum -y install samba samba-client system-config-samba cifs-utils

	#install c tools
	yum -y groupinstall development-tools
	yum -y install libedit-dev* man-pages libstdc++-docs

	#install C# programming
	yum -y install monodevelop monocomplete monodevelop-database monodevelop-versioncontrol

	if [[ $pi == 'n' ]]
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
	yum -y install mongodb-org epel-release nodejs npm
	service mongod start
	
	if [[ $desktop = 'y' ]]
	then
		#install desktop apps
		yum -y install eric geany lazarus drpython remmina remmina-plugin-rdp zenmap gparted
		

		#install a bunch of random stuff, I don't know if any of this works
		yum -y install scala erlang eclipse golang rust clojure dmd ldc gdc

		if [[ $pi == 'y' ]] ||   yum -q list steam | grep -q steam
		then
			echo no steam for you!
		else
			yum -y install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm
		
			#install codecs 
			yum -y install gstreamer{1,}-{ffmpeg,libav,plugins-{good,ugly,bad{,-free,-nonfree}}} ffmpeg 
			yum -y install steam
			yum installi gnash-plugin
		fi
	fi
fi

#install powerline
pip install -U pip
pip install git+git://github.com/Lokaltog/powerline

#install gems
gem install --no-rdoc --no-ri   sinatra haml slim rails shotgun pry bundler
#install gems for fuzzyl's stuff
gem install --no-rdoc --no-ri   git json redcarpet

#install node packages
npm -g update
npm -g install npm
npm -g install azure-cli express bower

if [[ $pi == 'n' ]]
then
	cabal update
	cabal install vector statistics attoparsec criterion
fi

exit 0
