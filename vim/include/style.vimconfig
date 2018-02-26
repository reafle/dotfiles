"""""""""" Styling """""""""" 

" Fahrenheit
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" " PaperColor
" set t_Co=256   " This is may or may not needed.
" 
" set background=dark
"colorscheme PaperColor

" colorscheme base16-default-dark
" let base16colorspace=256

" Setting the whitespace characters
set listchars=eol:$,tab:>·,trail:~,extends:>,precedes:<
set list

"" Add some distinction to active window
"hi CursorLine guibg=#303000 ctermbg=8 cterm=none term=none
augroup BgHighlight
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cul
    au WinLeave * setlocal nocul
augroup END

" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
if &term =~ '256color'
    set t_ut=
endif
