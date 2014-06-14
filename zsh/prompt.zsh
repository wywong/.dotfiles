# useful variables for prompt
_newline=$'\n'

setopt prompt_subst

function __git_prompt {
  git rev-parse --git-dir >& /dev/null
  if [[ $? == 0 ]] then
    echo -n "["
    echo -n `git branch | grep '* ' | sed 's/..//'`
    echo -n "] "
  fi
}

local GIT_PROMPT='$(__git_prompt)'

# (HH:MM:SS) [git_branch] user@host cwd
autoload -U colors && colors
PROMPT="%{$fg[cyan]%}(%*) \
%B${GIT_PROMPT}%b\
%{$fg[green]%}%n@%M \
%{$fg[yellow]%}\
%B%~%b%{$reset_color%}${_newline}%# "
