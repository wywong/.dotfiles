# ~/.bashrc: executed by bash(1) for interactive shells.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

export PS1="\n\e[32;40m\u@\H \e[33;40m\w\e[0m\n$ "

export EDITOR=vim

set -o vi

set -o noclobber

# source minimal vimrc
alias vi='vim -u "~/.vimrc_min"'
# source full vimrc
alias vim='vim -u "~/.vimrc"'

alias R='R --no-save'

alias rm='rm -i'
alias mv='mv -i'
alias ln='ln -i'
alias cp='cp -i'


COLOR_CMDS=(ls grep)
for cmd in ${COLOR_CMDS[@]}; do
  alias "$cmd=$cmd --color=auto"
done

alias ll='ls -alht'
alias la='ls -A'
alias l='ls -CFlht'

alias info='info --vi-keys'

alias df='df -h'
alias du='du -h'

echo Current Time: `date`

# add to path to the beginning of $PATH, # if does not already exist
pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$1:$PATH"}"
    fi
}

# add to path to the end of $PATH, if does not already exist
pathadd_tail() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:$1"}"
    fi
}

pathadd $HOME/bin

pathadd_tail './'

if [ -f ~/.bash_local ]; then
  . ~/.bash_local
fi
