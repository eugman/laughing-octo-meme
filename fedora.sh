if [ $EUID -z ]
then
	echo -e '\e[1;31 Run as bash! \e[0m'
elif [[ $EUID -ne 0]]
then
	echo -e "\e[1;31 You should be root! \e[0m"
else
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
	yum -y install monodevelop monocomplete

	#install haskell
	yum -y install ghc cabal-install
	cabal update
	cabal install vector statistics attoparsec criterion

	#install ruby
	yum -y install ruby ruby-devel sqlite3-devel
	gem install sinatra haml rails slim shotgun pry
	#add gems for fuzzyl's stuff
	gem install json git redcarpet

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

	#install a bunch of random stuff, I don't know if any of this works
	yum -y install scala erlang eclipse golang rust clojure dmd ldc gdc
fi
