let g:clear_trailing_ws = 1

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

function! SchemeChange(schemeName)
  if has('gui_running')
    " GUI colors
    colorscheme wombat
    if has("gui_gtk2")
      set guifont=Inconsolata\ 11
    elseif has("gui_win32")
      set guifont=Consolas:h10:cANSI
    endif
  else
    " Non-GUI (terminal) colors
    set t_Co=256
    " Set colorscheme
    exe 'colorscheme ' . a:schemeName
    " Do not underline cursor line
    hi CursorLine term=NONE cterm=NONE
  endif
  call TrailingWS()
  call lightline#init()
  call lightline#update()
endfunction

" turn syntax highlighting on
syntax enable

augroup FileColourScheme
  autocmd!
  autocmd BufEnter * call SchemeChange('hybrid')
  autocmd BufEnter *.py,*.sh call SchemeChange('wombat256')
augroup END
