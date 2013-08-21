highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
augroup HLTrailWS
  autocmd!
  autocmd BufWinEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
  autocmd InsertEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+\%#\@<!$/ | endif
  autocmd InsertLeave * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
  autocmd BufWinLeave * if &modifiable && &ft!='unite' | call clearmatches() | endif
augroup END

call unite#filters#matcher_default#use(['matcher_fuzzy'])

if has('win32')
  nnoremap <leader>fc :<C-u>Unite -no-split -start-insert -buffer-name=files file_rec<CR>
  nnoremap <leader>fs :<C-u>Unite -start-insert -buffer-name=files file_rec -default-action=split<CR>
  nnoremap <leader>fv :<C-u>Unite -start-insert -buffer-name=files file_rec -default-action=vsplit<CR>
else
  nnoremap <leader>fc :<C-u>Unite -no-split -start-insert -buffer-name=files file_rec/async<CR>
  nnoremap <leader>fs :<C-u>Unite -start-insert -buffer-name=files file_rec/async -default-action=split<CR>
  nnoremap <leader>fv :<C-u>Unite -start-insert -buffer-name=files file_rec/async -default-action=vsplit<CR>
endif

nnoremap <leader>bc :<C-u>Unite -no-split -buffer-name=buffer buffer<CR>
nnoremap <leader>bs :<C-u>Unite -buffer-name=buffer buffer -default-action=split<CR>
nnoremap <leader>bv :<C-u>Unite -buffer-name=buffer buffer -default-action=vsplit<CR>
