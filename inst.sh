cd ~;
git clone https://github.com/wywong/.dotfiles;
cd .dotfiles;
git clone https://github.com/Shougo/neobundle.vim ~/.dotfiles/vim/bundle/neobundle.vim;
cd ~;
rm -r .vim;
ln -sf .dotfiles/vim .vim;
ln -sf .dotfiles/vimrc .vimrc;
ln -sf .dotfiles/vimrc_min .vimrc_min;
ln -sf .dotfiles/bash/.bashrc .bashrc;
ln -sf .dotfiles/bash/.bash_profile .bash_profile;
ln -sf .dotfiles/git/.gitconfig .gitconfig;
ln -sf .dotfiles/tmux.conf .tmux.conf;
ln -sf .dotfiles/zshrc .zshrc;
vim +NeoBundleInstall +qall;
