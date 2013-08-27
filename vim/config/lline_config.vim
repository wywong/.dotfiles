let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'lineinfo': '%3l/%L:%-2v',
      \   'truncate': '%<',
      \ },
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste', 'readonly', 'modified' ],
      \             [ 'fugitive', 'filename', 'truncate' ] ],
      \   'right': [ [ 'percent' ],
      \            [ 'lineinfo' ],
      \            [ 'fullPath', 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'fullPath': 'MyFullPath',
      \ }
    \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &ro ? 'RO' : ''
endfunction

function! MyFugitive()
  return &ft !~? 'nerdtree' && exists('*fugitive#head') &&
        \ strlen(fugitive#head()) ? fugitive#head() : ''
endfunction

function! MyFullPath()
  return winwidth('.') > 90 && &ft !~? 'help' ? expand('%:p:h') : ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction
