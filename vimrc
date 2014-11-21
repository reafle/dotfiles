""" 5n0vv VIM config
""" Type [:help 'optionname'] while using vim for more info about each option

set nocompatible    " no vi compatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-endwise'
Bundle 'joshtronic/php.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kien/ctrlp.vim'
Bundle 'evidens/vim-twig'

filetype on
filetype plugin indent on " this plugin does not work well with php

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
"set wrap            " wrap long lines
set mouse=a         " full mouse support
set number          " show line numbers
set ttyfast         " smooth changes (indicates fast terminal connection)
"set modeline        " last lines in documents can have options for vim editors (see :help modeline)
"set modelines=5     " number lines checked for modelines (5 is default)
""" set textwidth=80    " automatically break line when it exceeds this width
set encoding=UTF-8  " character encoding
set nobomb          " no Byte Order Mark for UTF-8
set colorcolumn=80
set synmaxcol=250               " dont highlight long lines

let mapleader = ","

syntax on           " enable synax highlight
colors darkblue       " color schema

""" highlight whitespace in the end of line

highlight ColorColumn ctermbg=blue
highlight WhiteSpaceEOL ctermbg=darkgreen
"match WhiteSpaceEOL /^\s*\ \s*\ $\|\s\+$/
"match WhiteSpaceEOL /^\s*\ \s*\ $\|\s\+$\|\t/

" without matching will not be done in newly opened editor windows
autocmd WinEnter * match WhiteSpaceEOL /^\s*\ \s*\ $\|\s\+$\|\t/

""" custom filetype syntax highlight settings

autocmd BufRead,BufNewFile *.dry set filetype=dry
"autocmd BufRead,BufNewFile *.twig set filetype=htmltwig
autocmd BufRead,BufNewFile *.thtml set filetype=php

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" save file with sudo
cmap w!! w !sudo tee > /dev/null % 

" NERDtree configs
autocmd vimenter * NERDTree " start automatically
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "close if it's the last window
autocmd VimEnter * wincmd p

"toggle NERDtree via ctrl+n
map <C-n> :NERDTreeToggle<CR> 
