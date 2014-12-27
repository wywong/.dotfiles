setopt prompt_subst

# (HH:MM:SS) [branch] user@host cwd
autoload -U colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable hg git
zstyle ':vcs_info:(hg*|git*)' formats '[%b] '
zstyle ':vcs_info:(hg*|git*)' actionformats '[%b:%a] '

function prompt_precmd() {
  vcs_info
}

function prompt_set() {
  PROMPT="%{$fg[cyan]%}(%*) %B${vcs_info_msg_0_}%b%{$fg[green]%}%n@%M "
  PROMPT+="%{$fg[yellow]%}%B%~%b%{$reset_color%}"
  PROMPT+=$'\n'
  PROMPT+="%# "
}

add-zsh-hook precmd prompt_precmd
add-zsh-hook precmd prompt_set
