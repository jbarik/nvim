au BufNewFile,BufRead *.txt set ft=txt
au BufNewFile,BufRead *.log set ft=messages
au BufNewFile,BufRead *.info set ft=info
" Let vim know the zip files
au BufReadCmd *.jar,*.xpi,*.docx,*.slx call zip#Browse(expand("<amatch>"))

" Recent bug? Neovim is overriding the *.m extension as mma
" Use the following to see the list of filetype/syntax files
" :echo glob($VIMRUNTIME . '/ftplugin/*.vim')
" :echo glob($VIMRUNTIME . '/syntax/*.vim')
autocmd BufRead,BufNewFile *.m set filetype=matlab

