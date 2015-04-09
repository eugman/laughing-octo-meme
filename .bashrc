if [ `which tmux 2> /dev/null` -a -z "$TMUX" ]; then
    tmux -2 attach || tmux -2 new; exit
fi
