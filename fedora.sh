#update everything
su -c "yum -y update"

#install command line tools
su -c "yum -y install htop lynx irssi screen tmux mc nmap wget"

#install command line coding tools
su -c "yum -y install git valgrind"

#install samba
su -c "yum -y install samba samba-client system-config-samba cifs-utils"

#install c tools
su -c "yum -y groupinstall development-tools"
su -c "yum -y install libedit-dev* man-pages libstdc++-docs"

#install C# programming
su -c "yum -y install monodevelop"

#install haskell
su -c "yum -y install ghc cabal-install"
cabal update
cabal install vector statistics attoparsec

#install ruby
su -c "yum -y install ruby"
gem install sinatra haml

#install lamp
su -c "yum -y install httpd mysql mysql-server php php-mysql php-myadmin"
su -c "service httpd start; service mysql start"
#su -c "/user/bin/mysql_secure_installation"

#install mean
#http://docs.mongodb.org/manual/tutorial/install-mongodb-on-red-hat/
su -c "yum -y install mongodb-org nodejs npm"
su -c "npm -g install express bower"
su -c "service mongod start"

#install desktop apps
su -c "yum -y install eric geany lazarus drpython remmina remmina-plugin-rdp zenmap"
