"""
""" reafle .vimrc config
"""

""" [:help 'optionname'] for more info about each option

" disable vi compatibility - this is required by many plugins 
" and functions to work.
set nocompatible    

" This block defines Vundle plugin installation related configurations
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/vundle'
Plugin 'mileszs/ack.vim'
Bundle 'joshtronic/php.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'joonty/vdebug'
Bundle 'keith/tmux.vim'
Plugin 'christoomey/vim-tmux-navigator'

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
set encoding=UTF-8  " character encoding
set nobomb          " no Byte Order Mark for UTF-8
set colorcolumn=80
set synmaxcol=2500  " dont highlight long lines
set textwidth=0     " automatically break line when it exceeds this width
set nolist          " dont split long lines to several lines upon editing that line

syntax on           " enable synax highlight

" append current dir to the path
set path+=**

" use TAB for :find and other file command suggestions
set wildmenu

" Leader key (works like vim-special modifier key)  mapped to ,
let mapleader = ","

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

" save file with sudo
cmap w!! w !sudo tee > /dev/null % 

" Leader R to reload .vimrc 
nnoremap <Leader>r :so $MYVIMRC<CR>:echohl WarningMsg<Bar>echo "Reloaded .vimrc config...."<Bar>echohl None<CR>

" Leader chl to clear search highlights 
nnoremap <Leader>chl :noh<CR>



""""""""""""""" Plugin configurations

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


"" Vdebug
" Don't break on first line
let g:vdebug_options = {}
let g:vdebug_options["break_on_open"] = 0

" Leader+e to eval whats selected 
let g:vdebug_keymap = {}
let g:vdebug_keymap["eval_visual"] = "<Leader>e"


"" CtrlP
" Allow ctrlp to search through hidden files
let g:ctrlp_show_hidden = 1


"" NerdTREE
"toggle via ctrl+n
map <C-n> :NERDTreeToggle<CR> 
" leader + n = reveal current buffer in NERDTree
nmap <Leader>n :NERDTreeFind<CR>
" autocmd vimenter * NERDTree " start automatically
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "close if it's the last window
"TODO map s for 'open in split', v for 'open in vsplit'


"" ctags
" add :MakeTags command to generate tags
command! MakeTags !ctags -R .
" TODO: check |:help tags|
" TODO: make jumping better, currently we get a ton of js minified gibberish as a suggestion



""" TODO """

" TODO: find out wtf is this
" autocmd VimEnter * wincmd p

" TODO: check |:help ins-completion|

" TODO find how to not highlight ColorColumn
" highlight ColorColumn ctermbg=blue
" highlight WhiteSpaceEOL ctermbg=darkgreen
