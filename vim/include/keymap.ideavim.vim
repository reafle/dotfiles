" Heavily inspired by
" https://github.com/saaguero/ideavimrc/blob/master/.ideavimrc

" Navigating tabs
nnoremap <C-l> gt
nnoremap <C-h> gT

" Navigating windows
nnoremap <A-l> <c-w>l
nnoremap <A-j> <c-w>j
nnoremap <A-h> <c-w>h
nnoremap <A-k> <c-w>k

" Splits
nnoremap <C-w>s :action SplitHorizontally<CR>
nnoremap <C-w>v :action SplitVertically<CR>

" langserver emulation
nnoremap <Leader>lr :action RenameElement<cr>
nnoremap <Leader>lf :action ShowUsages<cr>
nnoremap <Leader>ls :action HighlightUsagesInFile<cr>

" fzf emulation
nnoremap <C-p> :action GotoFile<CR>
nnoremap <C-S-p> :action GotoClass<CR>

nnoremap gd :action GotoDeclaration<CR>

" clipboard
noremap "+y "*y
noremap "+Y "*Y
noremap "+p "*p
noremap "+P "*P

" built-in navigation to navigated items works better
nnoremap <c-o> :action Back<cr>
nnoremap <c-b> :action Forward<cr>
" but preserve ideavim defaults
nnoremap <C-S-o> <c-o>
nnoremap <C-S-b> <c-b>

nnoremap <A-n> :action ActivateProjectToolWindow<CR>
nnoremap <C-w>q :action CloseEditor<CR>
