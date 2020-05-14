au BufNewFile,BufRead *.txt set ft=txt
au BufNewFile,BufRead *.log set ft=messages
au BufNewFile,BufRead *.info set ft=info
" Let vim know the zip files
au BufReadCmd *.jar,*.xpi,*.docx,*.slx call zip#Browse(expand("<amatch>"))
