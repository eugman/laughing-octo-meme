#! /bin/bash

if [[ ! -e ~/Desktop/wiki.sh ]]
then
	cp wiki.sh ~/Desktop/
fi
cd dotfiles

#Copy dotfiles
if [[ ! -e ~/.vimrc ]]
then
	cp .vimrc ~/.vimrc
fi
if [[ ! -e ~/.tmux.conf ]]
then
	cp .tmux.conf ~/.tmux.conf
fi

if [[ ! -e ~/.gitconfig ]]
then
	cp .gitconfig ~/.gitconfig
fi
if ! grep -q tmux ~/.bashrc
then
	cat .bashrc >> ~/.bashrc
fi

if [[ ! -e ~/.gemrc ]]
then
	cp .gemrc ~/.gemrc
fi
if [[ ! -d ~/.irssi ]]
then
	mkdir ~/.irssi/
	cp irssiConfig ~/.irssi/config
fi
if [[ ! -d ~/progProj ]]
then
	mkdir  ~/progProj
	cd ~/progProj
	git clone https://github.com/fuzyll/coppermind.git
	git clone https://github.com/eugman/learnCTheHardWay.git
	git clone https://github.com/eugman/buildYourOwnLisp.git
	git clone https://github.com/eugman/where-at.git

	#https://powerline.readthedocs.org/en/latest/installation/linux.html
	git clone https://github.com/powerline/fonts.git
	bash fonts/install.sh
fi


exit 0

