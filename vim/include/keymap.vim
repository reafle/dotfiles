"""""""""" Keymapping """""""""" 

nnoremap <c-z> <nop>        " Disable the suddent death by accidental ctrl+z

" TODO: alt mappings breaks macros in insert mode 
" Leader key (works like vim-special modifier key) mapped to <Space>
let mapleader = " "

" <Leader>bd to delete all open buffers
noremap <Leader>bd :%bd<CR>
"
" <Leader>be to reload all buffers (useful after codebase update on FS)
noremap <Leader>be :bufdo e %<CR>

" Alt-t to open a new tab
noremap <M-t> :tabnew<CR>

" <Leader>R to reload .vimrc 
nnoremap <Leader>r :so $MYVIMRC<CR>:echohl WarningMsg<Bar>echo "Reloaded .vimrc config...."<Bar>echohl None<CR>

" <Leader>chl to clear search highlights 
nnoremap <silent> <Leader>chl :noh<CR>

" save file with sudo
cmap w!! w !sudo tee > /dev/null % 

" Since <C-a> is tmux prefix, re-bind increment/decrement to <M-a>/<M-x>
nnoremap <M-a> <C-a>
nnoremap <M-x> <C-x>

vnoremap <M-a> <C-a>
vnoremap <M-x> <C-x>

" Window resize using <Leader>= and <Leader>-
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Y to function as C 
nnoremap Y y$

" switch ; with :
nnoremap ; :
vnoremap ; :

" in terminal mode - esc = back to normal
" tnoremap <Esc> <C-\><C-n> 
