let g:lightline = {
      \ 'enable': {'statusline':1,},
      \ 'colorscheme': 'wombat'}

let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste' ],
      \           [ 'readonly', 'filename', 'modified' ] ],
      \ 'right': [ [ 'trailing' ],
      \            [ 'lineinfo' ],
      \            [ 'percent' ] ] }
"     \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }

let g:lightline.inactive = {
      \ 'left': [ [ 'filename' ] ],
      \ 'right': [ [ 'percent' ] ] }

let g:lightline.separator = {'left': '▶' , 'right': '◀'}
let g:lightline.component_expand = {'trailing': 'lightline#trailing_whitespace#component'}
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
