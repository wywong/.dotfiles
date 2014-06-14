# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

if [ -f ~/.zsh.first ]; then
  . ~/.zsh.first
fi

# check to see if login via ssh
if [ -z "$SSH_CONNECTION" ]; then
  [[ -z "$TMUX" ]] && exec tmux -2
fi

if [ -f ~/.zsh.before ]; then
  . ~/.zsh.before
fi

for config in `ls ~/.zsh`;
do
  source $HOME/.zsh/$config;
done

if [ -f ~/.zsh.local ]; then
  . ~/.zsh.local
fi
