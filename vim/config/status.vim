"statusline setup
set noruler
set laststatus=2

set statusline =%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*

" Fugitive
set statusline+=%#identifier#
set statusline+=%{fugitive#statusline()}
set statusline+=%*

"help file flag
set statusline+=%h

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*
"
"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

" left and right separator
set statusline+=%=

" Full path
set statusline+=%#identifier#
set statusline+=[%F]    
set statusline+=%*

set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format

" column and lines numbers
set statusline+=[%c,
set statusline+=%l/%L]
