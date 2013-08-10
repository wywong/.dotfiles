" turn syntax highlighting on
syntax enable
if has('gui_running')
  " GUI colors
  colorscheme mustang
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h10:cANSI
  endif
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

set tabstop=2        " tab width is 2 spaces
set softtabstop=2
set shiftwidth=2     " indent also with 2 spaces
set expandtab        " expand tabs to spaces

autocmd FileType make set noexpandtab

set textwidth=160
set number
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" use intelligent file completion like in the bash
set wildmode=longest:full
set wildmenu

set hlsearch
set incsearch

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set foldlevel=0

set wrap linebreak
au FilterWritePre * if &diff | set wrap | endif

set backspace=indent,eol,start

let mapleader=" "

let &backupdir=expand($VIMFILES) . "/swp//"
let &directory=expand($VIMFILES) . "/swp//"
