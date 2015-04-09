#Copy dotfiles
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf

#configure git
git config --global core.editor "vim"
git config --global color.ui true
git config --global user.name "Eugene Meidinger"
git config --global user.email eugene@eugenemeidinger.com
#git config --global push.default simple

mkdir  ~/progProj
cd ~/progProj
git clone https://github.com/fuzyll/coppermind.git
git clone https://github.com/eugman/learnCTheHardWay.git
git clone https://github.com/eugman/buildYourOwnLisp.git
git clone https://github.com/eugman/where-at.git
