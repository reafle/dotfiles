
"" vim-javascript
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

let g:ale_fix_on_save = 1

let g:neoformat_enabled_javascript = ['eslint']

" Minimal LSP configuration for JavaScript

if (executable('javascript-typescript-stdio'))
  let g:LanguageClient_serverCommands = get(g:, 'LanguageClient_serverCommands', {})
  let g:LanguageClient_serverCommands['javascript'] = ['javascript-typescript-stdio']
  let g:LanguageClient_serverCommands['javascript.jsx'] = ['javascript-typescript-stdio']
  " Use LanguageServer for omnifunc completion
  autocmd FileType javascript,javascript.jsx setlocal omnifunc=LanguageClient#complete
endif

let g:tagbar_type_javascript = {
      \ 'ctagstype' : 'javascript',
      \ 'kinds' : [
      \'a:const',
      \'b:let',
      \'d:var',
      \'e:function',
      \'h:class',
      \],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
      \ },
      \}


" npm install -g import-js
"
autocmd FileType js,javascript,javascript.jsx, noremap <Leader>u :ImportJSWord<CR>
