filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'

filetype plugin indent on

" rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['html'] }
let g:syntastic_check_on_open=1

let g:syntastic_loc_list_height=5

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let errorformat = '%W%f(%l): %tarning #%n: %m,%E%f(%l): %trror: %m'

" NERDTree
autocmd VimEnter * if !argc() | NERDTree | endif " Start NERDTree if no file specified
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

