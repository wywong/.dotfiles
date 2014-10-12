" Enhanced keyboard mappings
" toggle expandtab
nnoremap <F3> :call TabToggle()<CR>
" toggle ignorecase
nnoremap <F4> :call CaseToggle()<CR>
" build using makeprg with <F7>
nnoremap <F5> :make<CR>
" build using makeprg with <F7>, in insert mode exit to command mode, save and compile
inoremap <F5> <ESC>:w<CR>:make<CR>
" build using makeprg with <S-F7>
nnoremap <S-F5> :make clean all<CR>
" clear trailing whitespace
nnoremap <F8> :call CTWS()<CR>

" disable ex mode
noremap Q <nop>

" disable man lookup
noremap K <nop>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Window changing hotkeys
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" sort visual selection
vnoremap <Leader>s :sort<CR>gv
