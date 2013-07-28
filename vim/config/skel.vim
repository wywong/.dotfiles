" skel.vim
" templates for code

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

function! CreateRubySourceFile()
    silent! 0r ~/.vim/skel/templ.rb
    silent! exe "%s/%FILENAME%/"expand("<afile>")"/g"
endfunction

autocmd BufNewFile main.c 0r ~/.vim/skel/main.c
autocmd BufNewFile main.cpp 0r ~/.vim/skel/main.cpp
autocmd BufNewFile *.c call CreateCSourceFile()
autocmd BufNewFile *.cpp call CreateCPPSourceFile()
autocmd BufNewFile *.h call CreateHeaderFile()
autocmd BufNewFile *.hpp call CreateHPPFile()
autocmd BufNewFile *.rb call CreateRubySourceFile()
autocmd BufNewFile makefile 0r ~/.vim/skel/maketemp
autocmd BufNewFile Makefile 0r ~/.vim/skel/maketemp

