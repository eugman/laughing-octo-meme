if [ `which tmux 2> /dev/null` -a -z "$TMUX" ]; then
    tmux -2 attach || tmux -2 new; exit
fi

#http://www.reversiblean.com/install-vim-powerline/
#if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh ]; then
#    source /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
#fi
