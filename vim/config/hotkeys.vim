" Enhanced keyboard mappings
" in normal mode F2 will save the file
nnoremap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
inoremap <F2> <ESC>:w<CR>a
" toggle expandtab
nnoremap <F3> :set noexpandtab!<CR>
" build using makeprg with <F7>
nnoremap <F5> :make<CR>
" build using makeprg with <F7>, in insert mode exit to command mode, save and compile
inoremap <F5> <ESC>:w<CR>:make<CR>
" build using makeprg with <S-F7>
nnoremap <S-F5> :make clean all<CR>

" disable ex mode
noremap Q <nop>

" Window changing hotkeys
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

nnoremap <Leader>diff :diffthis<CR>
nnoremap <Leader>up :diffupdate<CR>

vnoremap <Leader>s :sort<CR>
