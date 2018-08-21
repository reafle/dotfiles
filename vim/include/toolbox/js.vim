"""""""""" JS """""""""" 

autocmd FileType js,javascript.jsx set foldmethod=syntax
autocmd FileType js,javascript.jsx,coffee set ts=2
autocmd FileType js,javascript.jsx,coffee set sw=2

""" Plugins
source ~/dotfiles/vim/include/plugins/js.vim

let g:neoformat_enabled_javascript = ['eslint']
" let g:neoformat_javascript_prettier = {
"             \ 'exe': 'prettier',
"             \ 'args': ['--single-quote', '--trailing-comma es5', '--jsx-bracket-same-line', '--print-width 100', '--arrow-parens avoid', '--stdin', '--stdin-filepath', '%:p'],
"             \ 'stdin': 1,
"             \ }
