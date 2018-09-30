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
	



	#Update everything
	apt-get update && apt-get -y upgrade && apt-get clean

	#Install command line tools
	apt-get -y install htop lynx screen tmux aptitude mc nmap wget curl ssh vim
	if [[ $pi == 'y' ]]
	then
		apt-get -y install wicd-curses
	fi
 
	#Install command line coding tools
	apt-get -y install valgrind python-pip
	if [[ $pi == 'y' ]]
	then
		apt-get -y install python-rpi.gpio
	fi

	#install c programming
	apt-get -y install build-essential libedit-dev manpages-dev
	
	#clean again
	apt-get clean


	if [[ $pi == 'n' ]]
	then

		#install arm toolchain
		apt-get -y install gcc-arm-none-eabi
	fi



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

	if [[ $desktop == 'y' && $pi == 'n' ]]
	then

        apt-get install anki python3-distutils

		#Install VS code
		curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
        install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
        sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        apt-get install apt-transport-https		
        apt-get update
		apt-get install code
		xdg-mime default code.desktop text/plain
        update-alternatives --set editor /usr/bin/code
	fi


exit 0
