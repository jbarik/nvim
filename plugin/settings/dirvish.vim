"call dirvish#add_icon_fn({p -> p[-1:]=='/'?'?':'?'})
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>

"folders at the top: >
"let g:dirvish_mode = ':sort ,^.*[\/],'
"folders at the bottom: >
let g:dirvish_mode = ':sort ,^.*[^\/],'

" To show tree
augroup dirvish_config
   autocmd!
   autocmd FileType dirvish
            \ nnoremap <silent><buffer> t ddO<Esc>:let @"=substitute(@", '\n', '', 'g')<CR>:r ! find "<C-R>"" -maxdepth 1 -print0 \| xargs -0 ls -Fd<CR>:silent! keeppatterns %s/\/\//\//g<CR>:silent! keeppatterns %s/[^a-zA-Z0-9\/]$//g<CR>:silent! keeppatterns g/^$/d<CR>:noh<CR>
augroup END

