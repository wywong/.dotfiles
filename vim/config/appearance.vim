let g:clear_trailing_ws = 1
let g:seoul256_background = 234

function! SchemeChange(schemeName)
  if has('gui_running')
    set guioptions-=m  "menu bar
    set guioptions-=T  "toolbar
    set guioptions-=r  "scrollbar
    set lines=999 columns=999 " maximize the window
    " GUI colors
    colorscheme wombat
    if has("gui_gtk2")
      set guifont=Inconsolata\ 11
    elseif has("gui_win32")
      set guifont=Consolas:h8:cANSI
    endif
  else
    " Non-GUI (terminal) colors
    set t_Co=256
    " Set colorscheme
    try
      exe 'colorscheme ' . a:schemeName
    catch
      exe 'colorscheme wombat256'
    endtry
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
  autocmd BufEnter * call SchemeChange('seoul256')
augroup END