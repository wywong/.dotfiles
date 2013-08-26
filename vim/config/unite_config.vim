let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :Unite history/yank<CR>

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

nnoremap <leader>ms :<C-u>Unite file_mru -default-action=split<CR>
nnoremap <leader>mv :<C-u>Unite file_mru -default-action=vsplit<CR>
