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
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundleLazy 'LaTeX-Box-Team/LaTeX-Box', {'autoload':{'filetypes':['tex']}}
NeoBundle 'mhinz/vim-signify'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-surround'
NeoBundle 'w0ng/vim-hybrid'

filetype plugin indent on

" netrw
source $VIMFILES/config/plug/netrw.vim

" Signify
source $VIMFILES/config/plug/signify.vim

" LightLine
set noruler
set laststatus=2
set lazyredraw
source $VIMFILES/config/plug/lightline.vim

" Latex-Box
source $VIMFILES/config/plug/latexbox.vim

" Rainbow Parentheses
source $VIMFILES/config/plug/rainbow.vim

" Fugitive
source $VIMFILES/config/plug/fugitive.vim

" Unite
source $VIMFILES/config/plug/unite.vim

" Slime
source $VIMFILES/config/plug/slime.vim
