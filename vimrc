"""
""" reafle .vimrc config
""

""" [:help 'optionname'] for more info about each option

""" Possible key maps: 
"
" Ctrl-@                 0x00            NUL
" Ctrl-A to Ctrl-Z       0x01 to 0x1A
" Ctrl-a to Ctrl-z       0x01 to 0x1A
" Ctrl-[                 0x1B            ESC
" Ctrl-\                 0x1C
" Ctrl-]                 0x1D
" Ctrl-^                 0x1E
" Ctrl-_                 0x1F
" Ctrl-?                 0x7F            DEL

" disable vi compatibility - this is required by many plugins 
" and functions to work.
set nocompatible    


"""""""""" Plugin Installation """""""""" 

"""""""""" auto install plug-vim """""""""" 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"
" Tools 
Plug 'teddywing/vim-ls-grep'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'keith/tmux.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
"Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-grepper'
"Plug 'drmikehenry/vim-fixkey'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" Common programming
" Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/AutoComplPop'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'w0rp/ale'

" PHP
Plug 'joonty/vdebug' 
Plug 'StanAngeloff/php.vim'
Plug 'php-vim/phpcd.vim', { 'for': 'php' , 'do': 'composer update' }
Plug 'docteurklein/vim-symfony'
Plug 'guenti/vim-php-cs-fixer'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'vim-php/tagbar-phpctags.vim'
"" Plug 'vim-scripts/phpfolding.vim'

" Twig / jinja2 syntax
Plug 'lumiliet/vim-twig'

" Ansible / YAML parsing
Plug 'chase/vim-ansible-yaml'

" CSS / SCSS
Plug 'cakebaker/scss-syntax.vim'

"Git
Plug 'tpope/vim-fugitive'

" Javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'marijnh/tern_for_vim'
" TODO: https://github.com/bigfish/vim-js-context-coloring

" Coffeescript O_o ?
Plug 'kchmck/vim-coffee-script'


call plug#end()

""""""""""Main configuration"""""""""" 


filetype on

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
set noesckeys       " allows using esc keys in insert mode - for macro recording

set relativenumber 
set number 

syntax on           " enable synax highlight

" append current dir to the path
set path+=**

" Disable ctrl+z
nnoremap <c-z> <nop>

"" wildmenu - use TAB for :find and other file command suggestions
"" TODO: configure

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
"set omnifunc=syntaxcomplete#Complete


"""""""""" Key mappings """""""""" 

" TODO: alt mappings breaks macros in insert mode 
" Leader key (works like vim-special modifier key) mapped to <Space>
let mapleader = " "

"inoremap <C-Space> <C-N>

" Leader bd to delete all buffers
noremap <Leader>bd :%bd<CR>

" Alt-t opens new tab"
noremap <M-t> :tabnew<CR>

" Leader R to reload .vimrc 
nnoremap <Leader>r :so $MYVIMRC<CR>:echohl WarningMsg<Bar>echo "Reloaded .vimrc config...."<Bar>echohl None<CR>

" Leader chl to clear search highlights 
nnoremap <silent> <Leader>chl :noh<CR>

" save file with sudo
cmap w!! w !sudo tee > /dev/null % 

" Since <C-a> is tmux prefix, re-bind increment/decrement to <M-a>/<M-x>
nnoremap <M-a> <C-a>
nnoremap <M-x> <C-x>

" Easier window resize
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>


""""""""" Language specific config  """"""""""
" PHP
autocmd FileType php set kp=pman
" TODO : ULTI SNIPPETS!!!!!
iab pr print_r();<Left><Left>
iab vd var_dump();<Left><Left>

iab prp echo "<pre>";<CR>print_r();<CR>echo "</pre>";<Up><Left><Left>
iab vdp echo "<pre>";<CR>var_dump();<CR>echo "</pre>";<Up><Left><Left>

" JS 
autocmd FileType js set foldmethod=syntax

" coffee
autocmd FileType coffee set ts=2
autocmd FileType coffee set sw=2

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
  exec "set <M-".c.">=\e".c
  exec "imap \e".c." <M-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

" Bind Alt+hjkl to navigate splits
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>

" nnoremap <silent> <M-/> :TmuxNavigatePrevious<cr> " TODO: removeme

" Bind C+hjkl to navigate tabs
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-h> :tabprevious<CR>


" Syntastic
"" Check file when it's opened
" let g:syntastic_check_on_open=1


"" Vdebug
" Don't break on first line
if (!exists("g:vdebug_options")) 
    let g:vdebug_options = {}
endif
let g:vdebug_options["break_on_open"] = 0

" Leader+ev to eval whats selected 
if (!exists("g:vdebug_keymap ")) 
    let g:vdebug_keymap = {}
endif
let g:vdebug_keymap["eval_visual"] = "<Leader>ev"

" Leader+et to trace visually selected variable
vnoremap <Leader>et "vy<Esc>:python debugger.handle_trace("<C-R>v")<CR>
vnoremap <Leader>ee :VdebugEval<Space>




"" Tagbar
map <silent> <M-m> :TagbarToggle<CR>
"inoremap <silent> <C-m> :TagbarToggle<CR>


"" NerdTREE
"toggle via ctrl+n
map <M-n> :NERDTreeToggle<CR> 

" leader + n = reveal current buffer in NERDTree
nmap <silent> <Leader>n :NERDTreeFind<CR>

" start automatically
"" autocmd vimenter * NERDTree 

"close if it's the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 

" maps s for 'open in split', v for 'open in vsplit'
let NERDTreeMapOpenVSplit="v"
let NERDTreeMapOpenSplit="s"

"" TODO : Nerdtree copy on key combo
" " yy to copy currently selected node
" function! NERDTreeYankCurrentNode()
"     let n = g:NERDTreeFileNode.GetSelected()
"     if n != {}
"         call setreg('+', n.path.str())
"     endif
" endfunction
" 
" call NERDTreeAddKeyMap({
"         \ 'key': 'yy',
"         \ 'callback': 'NERDTreeYankCurrentNode',
"         \ 'quickhelpText': 'put full path of current node into the default register' })


"" ctags
" add :MakeTags command to generate tags
command! MakeTags !ctags 
command! MakeTagsPhp !phpctags -R .
set tags+=tags,tags.vendors
" TODO: check |:help tags|
" TODO: make jumping better, currently we get a ton of js minified gibberish as a suggestion


"" vim-symfony
let g:symfony_app_console_path = "bin/console"

"" php-cs-fixer
let g:php_cs_fixer_path="php-cs-fixer"


"" phpfolding.vim
"autocmd FileType php set fdm=syntax
"noremap <Leader>zz <Esc>:EnableFastPHPFolds<Cr>
"noremap <Leader>zx <Esc>:EnablePHPFolds<Cr>
"noremap <Leader>zc <Esc>:DisablePHPFolds<Cr>

" vim-php-namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>


"" vim-surround
" add php tag surrounding
autocmd FileType php let b:surround_45 = "<?php \r ?>"

"" Ag
" Tweak to be able to pass parameters to Ag
function! s:ag_in(...)
  call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
endfunction

command! -nargs=+ -complete=dir AgIn call s:ag_in(<f-args>)
"autocmd VimEnter * command! Ag
"      \ call fzf#vim#ag({'left': '15%', 'options': '--reverse --margin 30%,0'})
"" bind K to Ag word under cursor
nnoremap K :AgIn . \b<C-R><C-W>\b<C-Left><Left>

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


"" vim-javascript


" DelimitMate
"" let delimitMate_expand_cr = 1


" YouCompleteMe
" These are the tweaks I apply to YCM's config, you don't need them but they might help.
" YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_auto_trigger = 1
set completeopt-=preview

"tern-js
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1


"" vim-grepper
nnoremap <leader>G :Grepper -tool git<cr>
nnoremap <leader>g :Grepper -tool ag<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Optional. The default behaviour should work for most users.
if (!exists("g:grepper")) 
    let g:grepper               = {}
endif
let g:grepper.tools         = ['git', 'ag', 'rg']
let g:grepper.jump          = 0
let g:grepper.next_tool     = '<leader>g'
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 0


"" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<M-e>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"""""""""""End plugin configurations""""""""" 
"
"
" switch ; with :
nnoremap ; :
vnoremap ; :

""" TODO """

" TODO: check |:help ins-completion|

" TODO code foldings - |:help folds|

