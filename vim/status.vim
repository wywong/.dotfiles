"statusline setup
set noruler
set laststatus=2

set statusline =%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*

set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format

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

" left and right separator
set statusline+=%=
" column and lines numbers
set statusline+=%c,
set statusline+=%l/%L
