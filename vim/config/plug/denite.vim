call denite#custom#var('file/rec', 'command', ['ag', '-l'])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-S'])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#map('insert,normal', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#map('insert,normal', "<C-s>", '<denite:do_action:split>')
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>w :<C-u>DeniteCursorWord grep:.<CR>
autocmd FileType denite call s:denite_settings()

function! s:denite_settings() abort
  nnoremap <silent><buffer><expr> <Esc>
    \ denite#do_map('quit')
  noremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
endfunction
