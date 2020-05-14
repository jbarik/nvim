set grepprg=ag\ --nogroup\ --nocolor\ --column
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" bind \ (backward slash) to grep shortcut
nnoremap \ :Ag<SPACE>

command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
