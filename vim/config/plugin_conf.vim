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
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundleLazy 'vim-ruby/vim-ruby', {'autoload':{'filetypes':['ruby']}}

filetype plugin indent on

" GitGutter
augroup GitGutter_auto
  let g:gitgutter_realtime = 0
  autocmd!
  autocmd VimEnter * GitGutterEnable
augroup END

" LightLine
set noruler
set laststatus=2
set lazyredraw
source $VIMFILES/config/lline_config.vim

" rainbow_parentheses
augroup rainbow_parens_auto
  au!
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
augroup END

" Fugitive
augroup Fugitive_auto
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" Unite
source $VIMFILES/config/unite_config.vim
