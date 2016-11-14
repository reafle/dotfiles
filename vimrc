"""
""" reafle .vimrc config
"""

""" [:help 'optionname'] for more info about each option

" disable vi compatibility - this is required by many plugins 
" and functions to work.
set nocompatible    


"""""""""" Plugin Installation """""""""" 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()


Plug 'teddywing/vim-ls-grep'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'keith/tmux.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

Plug 'joonty/vdebug'
Plug 'StanAngeloff/php.vim'
Plug 'tpope/vim-surround'

call plug#end()

""""""""""Main configuration"""""""""" 

filetype on
filetype plugin indent on 

set nobackup        " no backup files
set tabstop=4       " tab width
set shiftwidth=4    " numbers of spaces when shifting (using >> and <<)
set expandtab       " use spaces for identation
set softtabstop=4   " interpret spaces as tabs when pressing Backspace
set backspace=indent,eol,start " backspace tuneup

set hlsearch        " highlight search
set laststatus=2    " show status line
set scrolloff=3     " keep 3 lines when scrolling
set ignorecase      " ignore case when searching and autocompleting
set smartindent     " see :help indenting
set ruler           " show ruler with cursor position
set incsearch       " do incremental searching (search for pattern while it is being typed)
set nowrap          " don't wrap long lines
set mouse=v         " full mouse support
set number          " show line numbers
set ttyfast         " smooth changes (indicates fast terminal connection)
set lazyredraw      " smoother redraw
set term=xterm-256color         
set encoding=UTF-8  " character encoding
set nobomb          " no Byte Order Mark for UTF-8
set colorcolumn=0
set synmaxcol=3000  " dont highlight long lines
set textwidth=0     " automatically break line when it exceeds this width
set nolist          " dont split long lines to several lines upon editing that line

set winheight=15    " auto resize active split to 30 lines
set winminheight=5  " min split height is 5 lines

syntax on           " enable synax highlight

" append current dir to the path
set path+=**

"" wildmenu - use TAB for :find and other file command suggestions
"" TODO: configure

set wildmenu
set wildmode=list:longest,full

set wildignore+=.hg,.git,.svn              " Version control
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.1st,*.pyd
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?,*~                         " Vim swap files
set wildignore+=*.DS_Store                       " OS files
set wildignore+=*.orig                           " Merge resolution files
set wildignore+=*.luac,*.pyc,*.pyo,*.so,*.swf,*.swc,*.n
set wildignore+=*.jpg,*.png,*.bmp,*.jpeg,*.gif
set wildignore+=composer.lock,composer.phar      " symfony
set wildignore+=target/
set wildignore+=/target
set wildignore+=tmp/
set wildignore+=/tmp
set wildignore+=dist/
set wildignore+=/dist
set wildignore+=packaged/
set wildignore+=/packaged

" custom filetype syntax highlight settings
autocmd BufRead,BufNewFile *.dry set filetype=dry
autocmd BufRead,BufNewFile *.thtml,*.tpl set filetype=php

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" share the OS clipboard with vim + register
" perhaps not platform-independent
set clipboard=unnamed

" Enable omnifunc - autocompletion like intellisense
set omnifunc=syntaxcomplete#Complete


"""""""""" Key mappings """""""""" 

" Leader key (works like vim-special modifier key) mapped to <Space>
let mapleader = " "

" Ctrl+Space for autocompletion
"inoremap <C-Space> <C-N>

" Leader R to reload .vimrc 
nnoremap <Leader>r :so $MYVIMRC<CR>:echohl WarningMsg<Bar>echo "Reloaded .vimrc config...."<Bar>echohl None<CR>

" Leader R to reload .vimrc 
nnoremap <Leader>r :so $MYVIMRC<CR>:echohl WarningMsg<Bar>echo "Reloaded .vimrc config...."<Bar>echohl None<CR>

" Leader chl to clear search highlights 
nnoremap <Leader>chl :noh<CR>

" save file with sudo
cmap w!! w !sudo tee > /dev/null % 

" Since <C-a> is tmux prefix, re-bind increment/decrement to <A-a>/<A-x>
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

"""""""""" Styling """""""""" 

" Default colorscheme
colorscheme fahrenheit

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

"" Tabline styles
"hi TabLine cterm=none ctermfg=DarkBlue ctermbg=none
"hi TabLineSel term=bold cterm=Bold ctermfg=White ctermbg=Green 
"hi TabLineFill ctermfg=none ctermbg=none
"hi Title ctermfg=DarkYellow 
"
"" Menu styles
"hi PMenu ctermfg=DarkGreen ctermbg=LightBlue cterm=none term=none
"hi PMenuSel ctermfg=White ctermbg=DarkBlue cterm=None
"hi PMenuSBar ctermfg=White ctermbg=DarkBlue
"
"" Search style (shoutouts to Khalifa!)
"hi Search ctermfg=black ctermbg=Yellow cterm=none term=none
"
"" TODO  tag
"hi TODO ctermfg=black ctermbg=Yellow cterm=bold term=none

" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
if &term =~ '256color'
    set t_ut=
endif

""""""""""Plugin configurations"""""""""" 

"" vim-tmux-navigator

" A hack for gnome-terminal to recognise <Alt> not as escape
" See: http://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

" Bind Alt+hjkl to navigate splits
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-/> :TmuxNavigatePrevious<cr>

" Bind Leader+hjkl to navigate tabs
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-h> :tabprevious<CR>


"" Vdebug
" Don't break on first line
if (!exists("g:vdebug_options")) 
    let g:vdebug_options = {}
endif
let g:vdebug_options["break_on_open"] = 0

" Leader+e to eval whats selected 
if (!exists("g:vdebug_keymap ")) 
    let g:vdebug_keymap = {}
endif
let g:vdebug_keymap["eval_visual"] = "<Leader>e"


"" NerdTREE
"toggle via ctrl+n
map <C-n> :NERDTreeToggle<CR> 

" leader + n = reveal current buffer in NERDTree
nmap <silent> <Leader>n :NERDTreeFind<CR>

" start automatically
"" autocmd vimenter * NERDTree 

"close if it's the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 

" maps s for 'open in split', v for 'open in vsplit'
let NERDTreeMapOpenVSplit="v"
let NERDTreeMapOpenSplit="s"


"" ctags
" add :MakeTags command to generate tags
command! MakeTags !ctags -R .
" TODO: check |:help tags|
" TODO: make jumping better, currently we get a ton of js minified gibberish as a suggestion

"" vim-surround
" add php tag surrounding
autocmd FileType php let b:surround_45 = "<?php \r ?>"


"" FZF
" Ctrl+s for split
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Ctrl+p to call fzf
noremap <C-p> :FZF<cr>

" Fzf ignore files such as node modules,etc etc



"" vim-fugitive
" Open vertical splits
set diffopt+=vertical 


"" vim-ls-grep
" :lsg = LsGrep
cnoreabbrev lsg LsGrep

""""""""""End plugin configurations""""""""" 




" switch ; with :
nnoremap ; :

""" TODO """

" TODO: check |:help ins-completion|

" Escape mapped to Caps and vice versa
" TODO: platform independent if possible: 
"  -  ubuntu: setxkbmap -option caps:swapescape

" TODO code foldings - |:help folds|

