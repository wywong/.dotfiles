filetype off
set runtimepath+=$VIMFILES/bundle/neobundle/

call neobundle#rc((expand($VIMFILES) . "/bundle/"))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-ruby/vim-ruby'

" GitGutter
if has("unix")
  NeoBundle 'airblade/vim-gitgutter'
  augroup GitGutter_auto
    autocmd!
    autocmd VimEnter * GitGutterEnable
  augroup END
endif

filetype plugin indent on

augroup rainbow_parens_auto
  " rainbow_parentheses
  au!
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
augroup END

augroup NERDTree_auto
  " NERDTree
  autocmd!
  autocmd VimEnter * if !argc() | NERDTree | endif " Start NERDTree if no file specified
  autocmd bufenter *
  \ if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END
