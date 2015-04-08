#!/user/bin/env bash

#Update everything
apt-get update && apt-get -y upgrade

#Install command line tools
apt-get -y install htop lynx irssi screen tmux wicd-config aptitude mc nmap wget ssh ssh-server

#install samaba
apt-get install cifs-utils samaba-common-bin

#Install command line coding tools
apt-get -y install git valgrind python-rpi.gpio

#install c programming
apt-get -y install build-essential libedit-dev manpages-dev

#install C# programming
apt-get -y install mono-complete

#install haskell
##Haskell doesn't seem to play nice with the raspberry pi :(
#apt-get -y install ghc cabal-install
#cabal update
#cabal install vector statistics attoparsec criterion


#install ruby
apt-get install ruby
gem install sinatra haml slim rails shotgun bundler

#install lamp
apt-get install apache2 php5 mysql-client mysql-server phpmyadmin

#install desktop apps
apt-get -y install iceweasel geany remmina remmina-plugin-rdp evince zenmap



#todo: append iceweasel to autostart
