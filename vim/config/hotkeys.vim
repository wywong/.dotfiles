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

