filetype off
if has('vim_starting')
  set runtimepath+=$VIMFILES/bundle/neobundle.vim/
endif

call neobundle#rc((expand($VIMFILES) . "/bundle/"))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundleLazy 'vim-ruby/vim-ruby', {'autoload':{'filetypes':['ruby']}}

" GitGutter
augroup GitGutter_auto
  let g:gitgutter_realtime = 0
  autocmd!
  autocmd VimEnter * GitGutterEnable
augroup END

filetype plugin indent on

" rainbow_parentheses
augroup rainbow_parens_auto
  au!
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
augroup END

" NERDTree
augroup NERDTree_auto
  autocmd!
  let NERDTreeBookmarksFile = expand($VIMFILES) . '/tmp/.NERDTreeBookmarks'
  autocmd VimEnter * if !argc() | NERDTree | endif " Start NERDTree if no file specified
  autocmd bufenter *
  \ if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END

" Fugitive
augroup Fugitive_auto
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" Unite
source $VIMFILES/config/unite_config.vim
