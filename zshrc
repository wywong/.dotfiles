# auto completion
autoload -U compinit
compinit

# vi key bindings for shell input
bindkey -v

#default editor is vim
export EDITOR=vim

# reduce keytimeout to 0.1s
export KEYTIMEOUT=1

# Cycle up and down history
bindkey '^P' up-history
bindkey '^N' down-history

# Incremental search backward set to the same as bash
bindkey '^r' history-incremental-search-backward

# useful variables for prompt
_newline=$'\n'

# prompt with (HH:MM:SS) user@host cwd
autoload -U colors && colors
PROMPT="%{$fg[cyan]%}(%*) \
%{$fg[green]%}%m@%M \
%{$fg[yellow]%}\
%B%~%b%{$reset_color%}${_newline}%# "

COLOR_CMDS=(ls grep)
for cmd in ${COLOR_CMDS[@]}; do
  alias "$cmd=$cmd --color=auto"
done

# ignore duplicates in history
setopt HIST_IGNORE_DUPS

# source minimal vimrc
alias vi='vim -u "~/.vimrc_min"'
# source full vimrc
alias vim='vim -u "~/.vimrc"'

alias R='R --no-save'

alias rm='rm -i'
alias mv='mv -i'
alias ln='ln -i'
alias cp='cp -i'

alias ll='ls -alht'
alias la='ls -A'
alias l='ls -CFlht'

alias info='info --vi-keys'

alias df='df -h'
alias du='du -h'

# use xterm256-colors
alias tmux='tmux -2'

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' >| "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

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

if [ -f ~/.zsh.local ]; then
  . ~/.zsh.local
fi
