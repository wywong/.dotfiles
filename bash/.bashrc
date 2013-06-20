# ~/.bashrc: executed by bash(1) for interactive shells.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

export PS1="\n\e[32;40m\u@\H \e[33;40m\w\e[0m\n$ "

export EDITOR=vim

set -o vi

alias R='R --no-save'

alias rm='rm -i'
alias mv='mv -i'
alias ln='ln -i'
alias cp='cp -i'

alias ls='ls --color'
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CFlh'

alias info='info --vi-keys'


alias df='df -h'
alias du='du -h'

echo Current Time: `date`
