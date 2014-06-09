nnoremap <leader>rp :RainbowParenthesesToggleAll<CR>
augroup rainbow_parens_auto
  au!
  au VimEnter * RainbowParenthesesToggleAll
augroup END
