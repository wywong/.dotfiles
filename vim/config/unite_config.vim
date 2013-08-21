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

nnoremap <leader>f :<C-u>Unite -start-insert -buffer-name=files file<CR>
nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer buffer<CR>
