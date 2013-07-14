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

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'

filetype plugin indent on

" rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"statusline setup
set noruler
set laststatus=2

set statusline =%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*

set statusline+=%h      "help file flag

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

" Enhanced keyboard mappings
" in normal mode F2 will save the file
nnoremap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
inoremap <F2> <ESC>:w<CR>i
" toggle expandtab
nnoremap <F3> :set noexpandtab!<CR>
" toggle NERDTree
nnoremap <F4> :NERDTreeToggle<CR>
" build using makeprg with <F7>
nnoremap <F5> :make<CR>
" build using makeprg with <F7>, in insert mode exit to command mode, save and compile
inoremap <F5> <ESC>:w<CR>:make<CR>
" build using makeprg with <S-F7>
nnoremap <S-F5> :make clean all<CR>
" insert current time and date
nnoremap <F6> O<ESC>:r! echo Modified: `date "+\%Y-\%m-\%d"`<CR>kdd
" insert current time and date
inoremap <F6> <ESC>O<ESC>:r! echo Modified: `date "+\%Y-\%m-\%d"`<CR>kddi

function! CreateHeaderFile()
    silent! 0r ~/.vim/skel/templ.h
    silent! exe "%s/%FILENAME%/"expand("<afile>")"/g"
    silent! exe "%s/%INCLUDEPROTECTION%/__".toupper(expand("<afile>:r"))."_H__/g"
endfunction

function! CreateHPPFile()
    silent! 0r ~/.vim/skel/templ.hpp
    silent! exe "%s/%FILENAME%/"expand("<afile>")"/g"
    silent! exe "%s/%INCLUDEPROTECTION%/__".toupper(expand("<afile>:r"))."_HPP__/g"
endfunction


function! CreateCSourceFile()
    if expand("<afile>") == "main.c"
        return
    endif
    silent! 0r ~/.vim/skel/templ.c
    silent! exe "%s/%FILENAME%/"expand("<afile>")"/g"
    " :r removes file extension
    silent! exe "%s/%FILE%/".expand("<afile>:r").".h/g"
endfunction

function! CreateCPPSourceFile()
    if expand("<afile>") == "main.cpp"
        return
    endif
    silent! 0r ~/.vim/skel/templ.cpp
    silent! exe "%s/%FILENAME%/"expand("<afile>")"/g"
    " :r removes file extension
    silent! exe "%s/%FILE%/".expand("<afile>")"/g"
endfunction

autocmd BufNewFile main.c 0r ~/.vim/skel/main.c
autocmd BufNewFile main.cpp 0r ~/.vim/skel/main.cpp
autocmd BufNewFile *.c call CreateCSourceFile()
autocmd BufNewFile *.cpp call CreateCPPSourceFile()
autocmd BufNewFile *.h call CreateHeaderFile()
autocmd BufNewFile *.hpp call CreateHPPFile()
autocmd BufNewFile makefile 0r ~/.vim/skel/maketemp
autocmd BufNewFile Makefile 0r ~/.vim/skel/maketemp

autocmd VimEnter * if !argc() | NERDTree | endif " Start NERDTree if no file specified
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
