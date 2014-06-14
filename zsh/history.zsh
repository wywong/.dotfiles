# ignore duplicates in history
setopt HIST_IGNORE_DUPS

# do not record commands beginning with space
setopt HIST_IGNORE_SPACE

# update history everytime zsh is called
setopt SHARE_HISTORY

# env vars for history
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
