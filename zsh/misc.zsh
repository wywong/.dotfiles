# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

# no clobber
setopt NOCLOBBER

# Don’t push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS

# load zmv
autoload -U zmv
