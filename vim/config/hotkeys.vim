" Enhanced keyboard mappings
" Do not open help on F1
noremap <F1> <nop>
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

" clear the search register when redrawing vim
nnoremap <C-l> :let @/=""<CR><C-l>

" disable ex mode
noremap Q <nop>

" disable man lookup
noremap K <nop>

" a sane Y key
nnoremap Y y$

" move up and down on a wrapped line
nnoremap j gj
nnoremap k gk

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
