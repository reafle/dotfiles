"""""""""" JS """""""""" 

" EJS files are mustache files
autocmd BufNewFile,BufRead *.ejs,*._ejs set filetype=mustache

autocmd FileType json,js,typescript,typescript.tsx,javascript,javascript.jsx set foldmethod=syntax
autocmd FileType js,typescript,typescript.jsx,javascript,javascript.jsx,coffee,mustache set ts=2
autocmd FileType js,typescript,typescript.jsx,javascript,javascript.jsx,coffee,mustache set sw=2

" Some nicer tsx/jsx highlighting
" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

""" Plugins
source ~/dotfiles/vim/include/plugins/js.vim
