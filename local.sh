#! /bin/bash

#Copy dotfiles
if [[ ! -e ~/.vimrc ]]
then
	cp .vimrc ~/.vimrc
fi
if [[ ! -e ~/.vimrc ]]
then
	cp .tmux.conf ~/.tmux.conf
fi

cat .bashrc >> ~/.bashrc

#configure git
git config --global core.editor "vim"
git config --global color.ui true
git config --global user.name "Eugene Meidinger"
git config --global user.email eugene@eugenemeidinger.com
#git config --global push.default simple
if [[ ! -d ~/progProj ]]
then
	mkdir  ~/progProj
	cd ~/progProj
	git clone https://github.com/fuzyll/coppermind.git
	git clone https://github.com/eugman/learnCTheHardWay.git
	git clone https://github.com/eugman/buildYourOwnLisp.git
	git clone https://github.com/eugman/where-at.git
fi

exit 0

