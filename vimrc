if has('win32')
  set shellslash
  let $VIMFILES='$HOME/vimfiles'
else
  let $VIMFILES='$HOME/.vim'
endif

source $VIMFILES/config/general.vim       " configuration and colors
source $VIMFILES/config/plugin_conf.vim   " plugin configuration
source $VIMFILES/config/skel.vim          " code templates
source $VIMFILES/config/status.vim        " status line configuration
source $VIMFILES/config/hotkeys.vim       " hotkeys
