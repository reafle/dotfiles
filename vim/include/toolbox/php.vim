
"""""""""" PHP """""""""" 
set wildignore+=composer.lock,composer.phar      " symfony
autocmd BufRead,BufNewFile *.thtml set filetype=php
autocmd BufRead,BufNewFile *.tpl set filetype=xml

" not sure
" autocmd FileType php set kp=pman " set help function to pman

" TODO: Wait until more stable / fast
" let g:LanguageClient_serverCommands = {}
" let g:LanguageClient_serverCommands.php = ['php', '~/.vim/plugged/LanguageServer-php-neovim/vendor/felixfbecker/language-server/bin/php-language-server.php']
" autocmd FileType php LanguageClientStart
" autocmd FileType php setlocal omnifunc=LanguageClient#complete
" au filetype php setlocal omnifunc=phpactor#Complete
" au filetype php setlocal omnifunc=phpcomplete#Complete

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" TODO : ULTI SNIPPETS!!!!!
iab pr print_r();<Left><Left>
iab vd var_dump();<Left><Left>

iab prp echo "<pre>";<CR>print_r();<CR>echo "</pre>";<Up><Left><Left>
iab vdp echo "<pre>";<CR>var_dump();<CR>echo "</pre>";<Up><Left><Left>

iab <expr> dt strftime("%Y-%m-%d")
iab <expr> dts strftime("%Y-%m-%d %H:%M:%S")

function! PhpSyntaxOverride()
    hi!  def link phpCommentStar      phpComment
    hi!  def link phpDocComment       phpComment
    hi!  def link phpCommentTitle     phpComment
    hi!  def link phpDocTags          PreProc
    hi!  def link phpDocParam         Type
    hi!  def link phpDocIdentifier    phpComment
endfunction

""" PHP Plugins
source ~/dotfiles/vim/include/plugins/php.vim
