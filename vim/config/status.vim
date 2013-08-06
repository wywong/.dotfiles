"stl setup
set noruler
set laststatus=2

" stl == statusline 

set stl =%#identifier#
set stl+=[%t]    "tail of the filename
set stl+=%*

" Fugitive
set stl+=%#identifier#
set stl+=%{fugitive#statusline()}
set stl+=%*

"help file flag
set stl+=%h

"read only flag
set stl+=%#identifier#
set stl+=%r
set stl+=%*

" Truncate statusline here if too long
set stl+=%<

"modified flag
set stl+=%#identifier#
set stl+=%m
set stl+=%*
"
"display a warning if &paste is set
set stl+=%#error#
set stl+=%{&paste?'[paste]':''}
set stl+=%*

" left and right separator
set stl+=%=

" Full path
set stl+=%#identifier#
set stl+=[%F]    
set stl+=%*

set stl+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set stl+=%{&ff}] "file format

" column and lines numbers
set stl+=[%c,
set stl+=%l/%L]
