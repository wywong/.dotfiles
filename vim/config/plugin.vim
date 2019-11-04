filetype off
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:pymode_python = 'python3'

call plug#begin(expand($VIMFILES) . '/plugged')


if g:complete_plugins
  Plug 'Shougo/denite.nvim'
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  let g:deoplete#enable_at_startup = 1
endif

Plug 'Shougo/neoyank.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/seoul256.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git', {'for': ['gitcommit']}
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

if g:cpp_plugins
  Plug 'kergoth/aftersyntaxc.vim', {'for': ['c', 'cpp', 'h', 'hpp']}
  Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp', 'h', 'hpp']}
  Plug 'vim-jp/cpp-vim', {'for': ['c', 'cpp', 'h', 'hpp']}
endif

if g:web_plugins
  Plug 'pangloss/vim-javascript', {'for': ['js', 'jsx']}
  Plug 'mxw/vim-jsx', {'for': ['js', 'jsx']}
  Plug 'mattn/emmet-vim'
endif

if g:latex_plugins
  Plug 'LaTeX-Box-Team/LaTeX-Box', {'for': ['tex']}
endif

if g:python_plugins
  Plug 'klen/python-mode', {'for': ['python']}
endif

if g:ruby_plugins
  Plug 'tpope/vim-endwise', {'for': ['eruby', 'ruby', 'erb']}
  Plug 'tpope/vim-rails', {'for': ['eruby', 'ruby', 'erb']}
  Plug 'vim-ruby/vim-ruby', {'for': ['eruby', 'ruby', 'erb']}
endif

" source local Plug if it exists
if filereadable(glob(expand($HOME) . '/.Plug.local'))
  source $HOME/.Plug.local
endif

call plug#end()

filetype plugin indent on

" Source all plugin config files in the plug folder
let s:plugin_configs = split(globpath(expand($VIMFILES) . '/config/plug', '*'), '\n')
for plugin_ii in s:plugin_configs
  silent! exe 'source ' . plugin_ii
endfor

let s:optional_config_path = expand($VIMFILES) . '/config/optional'

" source optional plugin configs if needed

if g:complete_plugins
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
endif

if g:explorer_plugins
  silent! exe 'source ' . s:optional_config_path . '/explorers/vimfiler.vim'
else
  silent! exe 'source ' . s:optional_config_path . '/explorers/netrw.vim'
endif

if g:web_plugins
  let g:user_emmet_leader_key='<Tab>'
  let g:user_emmet_settings = {
    \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
    \}
endif

if g:latex_plugins
  silent! exe 'source ' . s:optional_config_path . '/latex/latexbox.vim'
endif

if g:python_plugins
  silent! exe 'source ' . s:optional_config_path . '/python/pymode.vim'
endif

