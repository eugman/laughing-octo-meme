#!/user/bin/env bash

#Update everything
sudo apt-get update && sudo apt-get -y upgrade

#Install command line tools
sudo apt-get -y install htop lynx irssi screen tmux wicd-config aptitude mc nmap

#install samaba
sudo apt-get install cifs-utils samaba-common-bin

#Install command line coding tools
sudo apt-get -y install git valgrind

#install c programming
sudo apt-get -y install build-essential libedit-dev manpages-dev

#install C# programming
sudo apt-get -y install mono-complete

#install haskell
sudo apt-get -y install ghc cabal-install
cabal update
cabal install vector statistics attoparsec

#install ruby
sudo apt-get install ruby
gem install sinatra haml

#install lamp
sudo apt-get install apache2 php5 mysql-client mysql-server php-myadmin

#install desktop apps
sudo apt-get -y install iceweasel geany remmina remmina-plugin-rdp evince zenmap



#todo: append iceweasel to autostart
