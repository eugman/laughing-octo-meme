#! /bin/bash

cd dotfiles

#Copy dotfiles
#if [[ ! -e ~/.vimrc ]]
#then
#	cp .vimrc ~/.vimrc
#fi
if [[ ! -d ~/.irssi ]]
then
	mkdir ~/.irssi/
	cp irssiConfig ~/.irssi/config
fi
if [[ ! -d ~/progProj ]]
then
	mkdir  ~/progProj
	cd ~/progProj
	git clone https://github.com/eugman/baking-pi.git

fi

    pip install rainbowstream

    npm -g update
    npm -g install npm
    npm -g install azure-cli
exit 0

