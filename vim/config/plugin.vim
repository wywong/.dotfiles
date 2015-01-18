filetype off
if has('vim_starting')
  set runtimepath+=$VIMFILES/bundle/neobundle.vim/
endif

call neobundle#begin((expand($VIMFILES) . "/bundle/"))

NeoBundleFetch 'Shougo/neobundle.vim'

if has('win32')
  NeoBundle 'Shougo/unite.vim'
else
  NeoBundle 'Shougo/vimproc.vim', {
        \ 'build' : {
        \     'cygwin'  : 'make -f make_cygwin.mak',
        \     'mac'     : 'make -f make_mac.mak',
        \     'unix'    : 'make -f make_unix.mak',
        \    },
        \ }
  NeoBundle 'Shougo/unite.vim', { 'depends' : [ 'Shougo/vimproc.vim' ] }
endif
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'junegunn/seoul256.vim'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'bitbucket:ludovicchabant/vim-lawrencium'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'tpope/vim-git', {'autoload':{'filetypes':['gitcommit']}}
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-surround'

if g:complete_plugins
  NeoBundle 'Shougo/neocomplete'
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'
endif

if g:cpp_plugins
  NeoBundleLazy 'kergoth/aftersyntaxc.vim', {'autoload':{'filetypes':['c', 'cpp', 'h', 'hpp']}}
  NeoBundleLazy 'octol/vim-cpp-enhanced-highlight', {'autoload':{'filetypes':['c', 'cpp', 'h', 'hpp']}}
  NeoBundleLazy 'vim-jp/cpp-vim', {'autoload':{'filetypes':['c', 'cpp', 'h', 'hpp']}}
endif

if g:explorer_plugins
  NeoBundleLazy 'Shougo/vimfiler', {'autoload' : { 'commands' : ['VimFiler']}}
endif

if g:latex_plugins
  NeoBundleLazy 'LaTeX-Box-Team/LaTeX-Box', {'autoload':{'filetypes':['tex']}}
endif

if g:python_plugins
  NeoBundleLazy 'klen/python-mode', {'autoload':{'filetypes':['python']}}
endif

if g:ruby_plugins
  NeoBundleLazy 'tpope/vim-endwise', {'autoload':{'filetypes':['eruby', 'ruby', 'erb']}}
  NeoBundleLazy 'tpope/vim-rails', {'autoload':{'filetypes':['eruby', 'ruby', 'erb']}}
  NeoBundleLazy 'vim-ruby/vim-ruby', {'autoload':{'filetypes':['eruby', 'ruby', 'erb']}}
endif

" source local neobundle if it exists
if filereadable(glob(expand($HOME) . '/.neobundle.local'))
  source $HOME/.neobundle.local
endif

call neobundle#end()

filetype plugin indent on

" Source all plugin config files in the plug folder
let s:plugin_configs = split(globpath(expand($VIMFILES) . '/config/plug', '*'), '\n')
for plugin_ii in s:plugin_configs
  silent! exe 'source ' . plugin_ii
endfor

let s:optional_config_path = expand($VIMFILES) . '/config/optional'

" source optional plugin configs if needed

if g:complete_plugins
  silent! exe 'source ' . s:optional_config_path . '/complete/neocomplete.vim'
  silent! exe 'source ' . s:optional_config_path . '/complete/neosnippet.vim'
endif

if g:explorer_plugins
  silent! exe 'source ' . s:optional_config_path . '/explorers/vimfiler.vim'
else
  silent! exe 'source ' . s:optional_config_path . '/explorers/netrw.vim'
endif

if g:latex_plugins
  silent! exe 'source ' . s:optional_config_path . '/latex/latexbox.vim'
endif

if g:python_plugins
  silent! exe 'source ' . s:optional_config_path . '/python/pymode.vim'
endif

