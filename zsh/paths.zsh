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
