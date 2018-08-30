""""""""""Plugin configurations"""""""""" 

"" w0rp/ale 
" TODO: waiting for https://github.com/w0rp/ale/pull/1258
let g:ale_html_htmlhint_options = '--format=unix --config .htmlhintrc'

let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_sign_style_error  = '>>'
let g:ale_sign_style_warning  = '>'
highlight ALEWarningSign ctermbg=yellow ctermfg=black
highlight! ALEWarningLine cterm=underline

"" vim-tmux-navigator

if !(has('nvim'))
" A hack for gnome-terminal to recognise <Alt> not as escape
" See: http://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
    let c='a'
    while c <= 'z'
      exec "set <M-".c.">=\e".c
      exec "imap \e".c." <M-".c.">"
      let c = nr2char(1+char2nr(c))
    endw
    set timeout ttimeoutlen=50
endif


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
let g:vdebug_options['path_maps']={'/app/':'/home/reafle/projects/timebase/'}

" Leader+et to trace visually selected variable
vnoremap <Leader>et "vy<Esc>:python debugger.handle_trace("<C-R>v")<CR>
vnoremap <Leader>ee :VdebugEval<Space>


"" Tagbar
map <silent> <M-m> :TagbarToggle<CR>

"" NerdTREE
"toggle via ctrl+n
map <M-n> :NERDTreeToggle<CR> 

" leader + n = reveal current buffer in NERDTree
nmap <silent> <Leader>n :NERDTreeFind<CR>

"close if it's the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 

" maps s for 'open in split', v for 'open in vsplit'
let NERDTreeMapOpenVSplit="v"
let NERDTreeMapOpenSplit="s"


"" ctags
" add :MakeTags command to generate tags
" command! MakeTags !ctags 
" command! MakeTagsPhp !phpctags -R .
" set tags+=tags,tags.vendors
" TODO: check |:help tags|
" TODO: make jumping better, currently we get a ton of js minified gibberish as a suggestion


"" vim-surround
" add php tag surrounding -  use `-` for <?php ?>
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
nnoremap <leader>fb :Gblame<CR>

"
" DelimitMate
"" let delimitMate_expand_cr = 1

" Vim auto-pairs
"" Disable unneeded functionality:
let g:AutoPairsShortcutFastWrap=""
let g:AutoPairsShortcutJump=""

" YouCompleteMe
" These are the tweaks I apply to YCM's config, you don't need them but they might help.
" YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
if !(has('nvim'))
    let g:ycm_add_preview_to_completeopt=1
    let g:ycm_confirm_extra_conf=0
    let g:ycm_min_num_of_chars_for_completion = 3
    let g:ycm_auto_trigger = 1
    set completeopt-=preview
endif


"" vim-grepper
if executable('rg')
    nnoremap <leader>gg :Grepper -tool rg -query 
else 
    nnoremap <leader>gg :Grepper -tool grep
endif
nmap <leader>gs <plug>(GrepperOperator)
xmap <leader>gs <plug>(GrepperOperator)

" Optional. The default behaviour should work for most users.
if (!exists("g:grepper")) 
    let g:grepper               = {}
    let g:grepper.tools         = ['rg', 'git', 'ag']
    let g:grepper.jump          = 0
    let g:grepper.stop          = 100
    let g:grepper.next_tool     = '<leader>g'
    let g:grepper.simple_prompt = 1
    let g:grepper.rg = {'escape': '\^$.*+?()[]{}|', 'grepformat': '%f:%l:%c:%m', 'grepprg': 'rg -HSF  --no-heading --vimgrep'}
endif


" vim-markdown-preview
let vim_markdown_preview_github=1 " Uses grip
let vim_markdown_preview_toggle=0
let vim_markdown_preview_hotkey='<Leader>md'
let vim_markdown_preview_temp_file=1


" LanguageClient
"" Automatically start language servers.
let g:LanguageClient_serverCommands = get(g:, 'LanguageClient_serverCommands', {})
" let g:LanguageClient_hoverPreview='never'

noremap <Leader>ld :call LanguageClient_textDocument_definition()<cr>
noremap <Leader>lh :call LanguageClient_textDocument_hover()<cr>
noremap <Leader>lr :call LanguageClient_textDocument_rename()<cr>
noremap <Leader>ls :call LanguageClient_textDocument_documentSymbol()<cr>
noremap <Leader>lf :call LanguageClient_textDocument_references()<cr>

" echodoc
if has('nvim')
    let g:echodoc_enable_at_startup = 1
endif


" Colorizer
au BufNewFile,BufRead *.sass,*.less,*.css,*.html.twig,*.tpl,*.html,*.htm  :ColorHighlight!
let g:colorizer_auto_color = 0
" let g:colorizer_auto_filetype = 'less,scss,sass,css,html'
let g:colorizer_skip_comments = 1


" vim-closetags
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx,*.twig"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.twig'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'


" ncm2
set shortmess+=c
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
au User Ncm2Plugin call ncm2#register_source({
            \ 'name' : 'css',
            \ 'priority': 9, 
            \ 'subscope_enable': 1,
            \ 'scope': ['css','scss'],
            \ 'mark': 'css',
            \ 'word_pattern': '[\w\-]+',
            \ 'complete_pattern': ':\s*',
            \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
            \ })

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" autocomplete tab to scroll up/down. Bonus feature - S-tab unindent
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<Tab>"
" inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<C-d>"

"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
 
