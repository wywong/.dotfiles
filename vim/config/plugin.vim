filetype off
if has('vim_starting')
  set runtimepath+=$VIMFILES/bundle/neobundle.vim/
endif

call neobundle#begin((expand($VIMFILES) . "/bundle/"))

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
NeoBundleLazy 'klen/python-mode', {'autoload':{'filetypes':['python']}}
NeoBundleLazy 'LaTeX-Box-Team/LaTeX-Box', {'autoload':{'filetypes':['tex']}}
NeoBundle 'mhinz/vim-signify'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-surround'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'wellle/tmux-complete.vim'

" source local neobundle if it exists
if filereadable(glob(expand($HOME) . '/.neobundle.local'))
  source $HOME/.neobundle.local
endif

call neobundle#end()

filetype plugin indent on

" Source all plugin config files
let s:plugin_configs = split(globpath(expand($VIMFILES) . '/config/plug', '*'), '\n')
for plugin_ii in s:plugin_configs
  silent! exe 'source ' . plugin_ii
endfor
