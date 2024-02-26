if [ ! "$TMUX" ]; then
  tmux attach || tmux new
fi
