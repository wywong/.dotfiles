set nocompatible

" turn syntax highlighting on
syntax enable
if has('gui_running')
  " GUI colors
  colorscheme wombat
  if has("gui_gtk2")
    set guifont=Inconsolata\ 11
  elseif has("gui_win32")
    set guifont=Consolas:h10:cANSI
  endif
else
  " Non-GUI (terminal) colors
  set t_Co=256
  colorscheme wombat256
  hi CursorLine term=NONE cterm=NONE
endif

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set autoread

set autoindent
set smartindent

set tabstop=2        " tab width is 2 spaces
set softtabstop=2
set shiftwidth=2     " indent also with 2 spaces
set expandtab        " expand tabs to spaces

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
augroup HLTrailWS
  autocmd!
  autocmd BufWinEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
  autocmd InsertEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+\%#\@<!$/ | endif
  autocmd InsertLeave * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
  autocmd BufWinLeave * if &modifiable && &ft!='unite' | call clearmatches() | endif
  autocmd BufWritePre * :%s/\s\+$//e " delete trailing whitespace on save
augroup END

augroup Filetype_Make
  autocmd!
  autocmd FileType make set noexpandtab
augroup END

set textwidth=160
set number
set scrolloff=5
if v:version >= 703
  augroup relNumbers
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * :setlocal relativenumber
    autocmd WinLeave * :setlocal norelativenumber
  augroup END
endif

set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" use intelligent file completion like in the bash
set wildmode=longest:full
set wildignore=*.o,*.obj,*.swp,\.git
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
augroup vimdiff_auto
  au!
  au FilterWritePre * if &diff | set wrap | endif
augroup END

set backspace=indent,eol,start

let mapleader=" "

let &backupdir=expand($VIMFILES) . "/tmp//"
let &directory=expand($VIMFILES) . "/tmp//"
