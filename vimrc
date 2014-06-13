if has('win32')
  " use forward slashes
  set shellslash
  let $VIMFILES='$HOME/vimfiles'
else
  let $VIMFILES='$HOME/.vim'
endif

source $VIMFILES/config/general.vim     " configuration and colors
source $VIMFILES/config/plugin.vim " plugin configuration
source $VIMFILES/config/templ.vim       " templates for code
source $VIMFILES/config/hotkeys.vim     " hotkeys
source $VIMFILES/config/colours.vim     " colours

" source local vimrc if it exists
if filereadable(glob(expand($HOME) . '/.vimrc.local'))
  source $HOME/.vimrc.local
endif
