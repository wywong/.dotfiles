" turn syntax highlighting on
syntax enable
if has('gui_running')
    " GUI colors
    colorscheme mustang
else
    " Non-GUI (terminal) colors
    set t_Co=256
    colorscheme wombat256
endif

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set nocompatible
set autoindent
set smartindent

set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

set textwidth=160
set number
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" use intelligent file completion like in the bash
set wildmode=longest:full
set wildmenu

set hlsearch

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set foldlevel=0
