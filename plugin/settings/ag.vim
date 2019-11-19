set grepprg=ag\ --nogroup\ --nocolor\ --column
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" bind \ (backward slash) to grep shortcut
nnoremap \ :Ag<SPACE>
