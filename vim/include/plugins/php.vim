""""""""""PHP Pugin configurations"""""""""" 

"" w0rp/ale 
let g:ale_php_phpcs_options = '--exclude=Generic.Commenting.DocComment,Symfony.Commenting.License.Warning'
let g:ale_php_phpcs_standard = 'PSR2'
let g:ale_php_phpmd_ruleset = 'ruleset.xml'


"" php-cs-fixer
let g:php_cs_fixer_path="php-cs-fixer"


" vim-php-namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>


"Php-doc-modded
nnoremap <Leader>pd call PhpDocSingle()<CR> 
vnoremap <Leader>pd :call PhpDocRange()<CR> 
imap <Leader>pd paste<CR>:exe PhpDoc()<CR>:set nopaste<CR>i

" phpcd
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']

" phpactor
let g:phpactor_executable = '~/.config/nvim/plugged/phpactor/bin/phpactor'
" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>
" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>
" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>
" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>
" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>
" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>


""" vim-symfony
" let g:symfony_app_console_path = "bin/console"
"map <leader>sc :execute ":!"g:symfony_enable_shell_cmd<CR>

