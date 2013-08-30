let g:unite_force_overwrite_statusline = 0
let g:unite_source_history_yank_enable = 1
let g:unite_winheight = 10
let g:unite_data_directory = expand($VIMFILES). '/tmp/unite'
nnoremap <leader>y :Unite -resume history/yank<CR>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.swp$',
      \ '\.o$',
      \ '\.obj$',
      \ 'tmp/',
      \ ], '\|'))

if has('win32')
  nnoremap <leader>fc :<C-u>Unite -resume -no-split -start-insert -buffer-name=files file_rec<CR>
  nnoremap <leader>fs :<C-u>Unite -resume -start-insert -buffer-name=files file_rec -default-action=split<CR>
  nnoremap <leader>fv :<C-u>Unite -resume -start-insert -buffer-name=files file_rec -default-action=vsplit<CR>
else
  nnoremap <leader>fc :<C-u>Unite -resume -no-split -start-insert -buffer-name=files file_rec/async<CR>
  nnoremap <leader>fs :<C-u>Unite -resume -start-insert -buffer-name=files file_rec/async -default-action=split<CR>
  nnoremap <leader>fv :<C-u>Unite -resume -start-insert -buffer-name=files file_rec/async -default-action=vsplit<CR>
endif

nnoremap <leader>bc :<C-u>Unite -resume -quick-match -no-split -buffer-name=buffer buffer<CR>
nnoremap <leader>bs :<C-u>Unite -resume -quick-match -buffer-name=buffer buffer -default-action=split<CR>
nnoremap <leader>bv :<C-u>Unite -resume -quick-match -buffer-name=buffer buffer -default-action=vsplit<CR>

nnoremap <leader>ms :<C-u>Unite -resume -buffer-name=recent file_mru<CR>
nnoremap <leader>ms :<C-u>Unite -resume -buffer-name=recent file_mru -default-action=split<CR>
nnoremap <leader>mv :<C-u>Unite -resume -buffer-name=recent file_mru -default-action=vsplit<CR>

nnoremap <leader>/ :<C-u>Unite grep:. -default-action=split<CR>
