set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
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

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
"set nofoldenable        "dont fold by default
set foldlevel=0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Enhanced keyboard mappings
" in normal mode F2 will save the file
nnoremap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
nnoremap <F3> :set noexpandtab!<CR>
" toggle expandtab
inoremap <F2> <ESC>:w<CR>i
" insert current time and date
nnoremap <F4> O<ESC>:r! echo Modified: `date`<CR>kdd
" insert current time and date
inoremap <F4> <ESC>O<ESC>:r! echo Modified: `date`<CR>kddi
" build using makeprg with <F7>
nnoremap <F7> :make<CR>
" build using makeprg with <F7>, in insert mode exit to command mode, save and compile
inoremap <F7> <ESC>:w<CR>:make<CR>
" build using makeprg with <S-F7>
noremap <S-F7> :make clean all<CR>

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
