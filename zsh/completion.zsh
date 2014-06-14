# auto completion
zmodload zsh/complist
autoload -U compinit && compinit

# completion settings
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:*:*:*' menu select

## case-insensitive (all),partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unset CASE_SENSITIVE
else
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fi

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $HOME/.zsh/cache/

