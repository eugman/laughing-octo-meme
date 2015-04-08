#update everything
yum -y update

#install command line tools
yum -y install htop lynx irssi screen tmux mc nmap wget

#install command line coding tools
yum -y install git valgrind

#install samba
yum -y install samba samba-client system-config-samba cifs-utils

#install c tools
yum -y groupinstall development-tools
yum -y install libedit-dev* man-pages libstdc++-docs

#install C# programming
yum -y install monodevelop monodevelop-versioncontrol monodevelop-database

#install haskell
yum -y install ghc cabal-install
cabal update
cabal install vector statistics attoparsec criterion

#install ruby
yum -y install ruby
gem install sinatra haml rails slim shotgun

#install lamp
yum -y install httpd mysql mysql-server php php-mysql php-myadmin
service httpd start; service mysql start
#/user/bin/mysql_secure_installation

#install mean
#http://docs.mongodb.org/manual/tutorial/install-mongodb-on-red-hat/
yum -y install mongodb-org nodejs npm
npm -g install express bower
service mongod start

#install desktop apps
yum -y install eric geany lazarus drpython remmina remmina-plugin-rdp zenmap
