""""""""""Main configuration"""""""""" 

if !(has('nvim'))
    source ~/dotfiles/vim/include/general.vim.vim
endif

if (has('nvim'))
    source ~/dotfiles/vim/include/general.nvim.vim
endif

filetype on         " autodetect the current file type
syntax on           " enable syntax highlight

set nobackup        " no backup files
set tabstop=4       " tab width
set shiftwidth=4    " numbers of spaces when shifting (using >> and <<)
set expandtab       " use spaces for identation
set softtabstop=4   " interpret spaces as tabs when pressing Backspace
set backspace=indent,eol,start " backspace tuneup

set hidden          " ability to close unsaved buffer
set noshowmode      " Doesn't show current typing mode (saves space for echodoc.vim)
set hlsearch        " highlight search
set laststatus=2    " show status line
set scrolloff=3     " keep 3 lines when scrolling
set ignorecase      " ignore case when searching and autocompleting
set smartindent     " see :help indenting
set ruler           " show ruler with cursor position
set incsearch       " do incremental searching (search for pattern while it is being typed)
set nowrap          " don't wrap long lines
set mouse=a         " full mouse support
set number          " show line numbers
set ttyfast         " smooth changes (indicates fast terminal connection)
set lazyredraw      " smoother redraw
set encoding=UTF-8  " character encoding
set nobomb          " no Byte Order Mark for UTF-8
set colorcolumn=0   " disable color of column 80
set synmaxcol=500   " dont highlight long lines
set textwidth=0     " automatically break line when it exceeds this width
set nolist          " dont split long lines to several lines upon editing that line

set updatetime=100  " faster update time
set winheight=15    " auto resize active split to 30 lines
set winminheight=5  " min split height is 5 lines

set relativenumber  " enable relative line numbering
set number          " enable line numbers

set clipboard=unnamed " share the OS clipboard with vim + register
set path+=** " append current dir to the path

set wildmenu
set wildmode=list:longest,full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.1st,*.pyd
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?,*~                         " Vim swap files
set wildignore+=*.DS_Store                       " OS files
set wildignore+=*.orig                           " Merge resolution files
set wildignore+=*.luac,*.pyc,*.pyo,*.so,*.swf,*.swc,*.n
set wildignore+=*.jpg,*.png,*.bmp,*.jpeg,*.gif
set wildignore+=target/
set wildignore+=/target
set wildignore+=tmp/
set wildignore+=/tmp
set wildignore+=dist/
set wildignore+=/dist
set wildignore+=packaged/
set wildignore+=/packaged

set nofoldenable " Don't fold by default

" custom filetype syntax highlight settings
autocmd BufRead,BufNewFile *.dry set filetype=dry

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
" set viminfo='10,\"100,:20,%,n~/.viminfo

