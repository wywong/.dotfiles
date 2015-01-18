nnoremap <leader>rp :RainbowParenthesesToggleAll<CR>
augroup rainbow_parens_auto
  autocmd!
  autocmd VimEnter * RainbowParenthesesToggleAll
augroup END
