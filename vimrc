if has('win32')
  " use forward slashes
  set shellslash
  let $VIMFILES='$HOME/vimfiles'
else
  let $VIMFILES='$HOME/.vim'
endif

" source local vimrc if it exists
if filereadable(glob(expand($HOME) . '/.vimrc.before'))
  source $HOME/.vimrc.before
endif

source $VIMFILES/config/general.vim " general configuration
source $VIMFILES/config/utils.vim   " utility functions
source $VIMFILES/config/flags.vim   " configuration flags

" source .vimrc.flags to override defaults if needed
if filereadable(glob(expand($HOME) . '/.vimrc.flags'))
  source $HOME/.vimrc.flags
endif

source $VIMFILES/config/plugin.vim  " plugin configuration
source $VIMFILES/config/templ.vim   " templates for code
source $VIMFILES/config/hotkeys.vim " hotkeys
source $VIMFILES/config/colours.vim " colours

" source local vimrc if it exists
if filereadable(glob(expand($HOME) . '/.vimrc.after'))
  source $HOME/.vimrc.after
endif
