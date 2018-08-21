autocmd BufWritePost *.scala silent :EnTypeCheck

let g:ale_linters.scala = ['scalac', 'scalastyle']

nnoremap <leader>et :EnType<CR>
nnoremap <Leader>ed :EnDeclaration<CR>
nnoremap <Leader>eu :EnSuggestImport<CR>
nnoremap <Leader>efr :EnUsages<CR>
nnoremap <Leader>er :EnRename<CR>
