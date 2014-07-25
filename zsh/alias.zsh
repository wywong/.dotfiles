#default editor is vim
export EDITOR=vim

# reduce keytimeout to 0.1s
export KEYTIMEOUT=1

# vi key bindings for shell input
bindkey -v

# Incremental search backward set to the same as bash
bindkey '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# Cycle up and down history like bash
bindkey '^P' up-history
bindkey '^N' down-history

# source minimal vimrc
alias vi='vim -u "~/.vimrc_min"'
# source full vimrc
alias vim='vim -u "~/.vimrc"'

alias R='R --no-save'

alias rm='rm -i'
alias mv='mv -i'
alias ln='ln -i'
alias cp='cp -i'

alias grep='grep --color=auto'

alias cd=' cd'

alias ls=' ls --color=auto'
alias ll=' ls -alht'
alias la=' ls -A'
alias l=' ls -CFlht'

alias info='info --vi-keys'

alias df='df -h'
alias du='du -h'

# use xterm256-colors
alias tmux='tmux -2'

