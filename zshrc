# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

if [ -f ~/.zsh.before ]; then
  . ~/.zsh.before
fi

# disable flow control
stty -ixon

for config in `ls ~/.zsh`;
do
  source $HOME/.zsh/$config;
done

if [ -f ~/.zsh.after ]; then
  . ~/.zsh.after
fi
