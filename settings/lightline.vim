set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \     'left': [ ['mode', 'paste'],
      \               ['readonly', 'filename', 'modified']
      \             ],
      \     'right': [ ['trailing'], ['lineinfo', 'percent'] ]
      \ },
      \ 'separator' : { 'left': "▶", 'right': "◀" },
      \ 'subseparator': { 'left': "»", 'right': "«" }
      \ }

" \ 'colorscheme': 'one',

" Trailing whitespace status
"
" Register the component
let g:lightline.component_expand = {'trailing': 'lightline#trailing_whitespace#component'}
" Set color to the component (use warning or error):
let g:lightline.component_type = {'trailing': 'error'}

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'
" '' ''
