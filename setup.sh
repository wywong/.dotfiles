cd ~;
git clone https://github.com/wywong/.dotfiles;
cd .dotfiles;
git clone https://github.com/Shougo/neobundle.vim ~/.dotfiles/vim/bundle/neobundle.vim;
cd ~;
rm -rf .vim;
ln -sf .dotfiles/vim .vim;
ln -sf .dotfiles/vimrc .vimrc;
ln -sf .dotfiles/vimrc_min .vimrc_min;
cp .dotfiles/vim/config/flags.vim .vimrc.flags
ln -sf .dotfiles/bash/.bashrc .bashrc;
ln -sf .dotfiles/bash/.bash_profile .bash_profile;
ln -sf .dotfiles/git/templates .git_templates;
ln -sf .dotfiles/git/.gitconfig .gitconfig;
ln -sf .dotfiles/hgrc .hgrc
ln -sf .dotfiles/tmux.conf .tmux.conf;
rm -rf .zsh;
ln -sf .dotfiles/zsh .zsh;
ln -sf .dotfiles/zshrc .zshrc;
vim +NeoBundleInstall +qall;
