""""""""""Plugin configurations"""""""""" 

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
let NERDTreeDirArrows = 1


"" vim-surround
" add php tag surrounding -  use `-` for <?php ?>
autocmd FileType php let b:surround_45 = "<?php \r ?>"


"" Ag
" Tweak to be able to pass parameters to Ag
function! s:ag_in(...)
  call fzf#vim#rg(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
endfunction

command! -nargs=+ -complete=dir AgIn call s:ag_in(<f-args>)

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

" TODO: Fzf ignore files such as node modules,etc etc


"" vim-fugitive
" Open vertical splits
set diffopt+=vertical 
nnoremap <leader>fb :Gblame<CR>

"
" Vim auto-pairs
"" Disable unneeded functionality:
let g:AutoPairsShortcutFastWrap=""
let g:AutoPairsShortcutJump=""


"" vim-grepper
if executable('rg')
    nnoremap <leader>gg :Grepper -tool rg -query <CR>
else 
    nnoremap <leader>gg :Grepper -tool grep
endif
nmap <leader>gs <plug>(GrepperOperator)
xmap <leader>gs <plug>(GrepperOperator)

" Optional. The default behaviour should work for most users.
if (!exists("g:grepper")) 
    let g:grepper               = {}
    let g:grepper.tools         = ['rg']
    let g:grepper.jump          = 0
    let g:grepper.stop          = 200
    let g:grepper.next_tool     = '<leader>g'
    let g:grepper.simple_prompt = 1
    let g:grepper.rg = {'escape': '\^$.*+?()[]{}|', 'grepformat': '%f:%l:%c:%m', 'grepprg': 'rg -HSF  --no-heading --vimgrep --hidden'}
endif


" vim-markdown-preview
let vim_markdown_preview_github=1 " Uses grip
let vim_markdown_preview_toggle=0
let vim_markdown_preview_hotkey='<Leader>md'


" echodoc
if has('nvim')
    let g:echodoc_enable_at_startup = 1
endif


" Colorizer
au BufNewFile,BufRead *.sass,*.less,*.css,*.html.twig,*.tpl,*.html,*.htm  :ColorHighlight!
let g:colorizer_auto_color = 0
let g:colorizer_skip_comments = 1


" vim-closetags
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx,*.twig,*.ts,*.tsx"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.twig,*.ts,*.tsx'
let g:closetag_regions =  {
\ 'typescriptreact': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ }
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'


" vim-gutter
let g:gitgutter_max_signs = 1000


" coc-vim
let g:coc_node_path = $HOME . "/.nvm/versions/node/v14.15.1/bin/node"
