function! TabToggle()
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
endfunction

function! CaseToggle()
  if &ignorecase
    set noignorecase
  else
    set ignorecase
  endif
endfunction

function! CTWS()
  silent! exe '%s/\s\+$//e'
endfunction

function! ClearTWS()
  if g:clear_trailing_ws
    call CTWS()
  endif
endfunction

function! TrailingWS()
  " Trailing whitespace is red
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
  augroup HLTrailWS
    autocmd!
    autocmd BufWinEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
    autocmd InsertEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+\%#\@<!$/ | endif
    autocmd InsertLeave * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
    autocmd BufWinLeave * if &modifiable && &ft!='unite' | call clearmatches() | endif
    " delete trailing whitespace on save
    autocmd BufWritePre * call ClearTWS()
  augroup END
endfunction

