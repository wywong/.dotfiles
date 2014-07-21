" set nocompatible for when I run vim with -u
set nocompatible

" set character encoding used inside vim
set enc=utf-8
" set file encoding
set fenc=utf-8
" set terminal encoding
set termencoding=utf-8

" automatically read in changes of a modified file
set autoread

" automatically indent when starting a new line
set autoindent
" smart indenting
set smartindent

" ignore case when searching
set ignorecase

" tab width is 4 spaces
set tabstop=4
" tabs are expanded to 4 spaces
set softtabstop=4
" indent also with 4 spaces
set shiftwidth=4
" expand tabs to spaces
set expandtab

" set no ruler
set noruler

" always display status line
set laststatus=2

" lazyredraw to speed things up
set lazyredraw

augroup Filetype_Make
  autocmd!
  autocmd FileType make set noexpandtab
augroup END

set textwidth=80
set number
" show at least 5 lines above or below
set scrolloff=5
if v:version >= 703
  " enable relative line numbers
  augroup relNumbers
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * :setlocal relativenumber
    autocmd WinLeave * :setlocal norelativenumber
  augroup END
endif

" show matching brackets
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" wildmenu settings
" full - next full match
" longest - complete until longest common string
set wildmode=longest:full
" list of file patterns to ignore
set wildignore=*.o,*.obj,*.swp,\.git
" enable wildmenu
set wildmenu

" highlight search matches
set hlsearch
" search as you type
set incsearch

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set foldlevel=0

" wrap long lines according to breakat option
" default breakat - ^I!@*-+;:,./?
set wrap linebreak
augroup vimdiff_auto
  au!
  au FilterWritePre * if &diff | set wrap | endif
augroup END

" affects <BS>
" indent - allow backspacing autoindent
" eol - allow backspacing line breaks
" start - allow backspacing over the start of an insert
set backspace=indent,eol,start

" set leader key to space
let mapleader=" "

" directory for ~ files
let &backupdir=expand($VIMFILES) . "/tmp//"
" directory for .swp files
let &directory=expand($VIMFILES) . "/tmp//"

" CursorHold triggered after 2s
set updatetime=2000
" Clear the last search after 2s
augroup clear_last_search
  autocmd!
  au CursorHold * :let @/=""
augroup END
