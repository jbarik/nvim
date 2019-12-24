nmap <silent> <Space>b :Buffer<CR>
nmap <silent> <Space>h :History<CR>
nnoremap <silent> <Space>f :Files <C-r>=expand("%:h")<CR>/<CR>

function AgSearchFile(...)
   if (a:0 < 2)
      echoerr 'Insufficient arguments'
   end
   let l:search_exp = join(a:000[1:7], '.*')

   call fzf#run(fzf#wrap({'source':'ag --nogroup --column --color -g' .l:search_exp. ' ' .a:1,
         \                        'sink':'e',
         \                        'options':['--ansi', '--multi', '--color', 'hl:4,hl+:12']}))
endfunction
nmap <Space>a :SearchFile matlab/src
command! -bang -complete=dir -nargs=+ SearchFile call AgSearchFile(<f-args>)

"let s:color1 = '--colors path:fg:249,227,82 --colors line:fg:255,160,160 --colors column:fg:255,160,160 --colors match:fg:115,210,22 '
"let s:color2 = '--colors path:fg:115,210,22 --colors path:style:bold --colors match:fg:236,86,109 '
"let s:color3 = '--colors path:fg:115,210,22  --colors line:fg:234,234,14 --colors column:fg:234,234,14 --colors match:fg:236,86,109 '
"let s:color4 = '--colors path:fg:57,229,229  --colors line:fg:236,86,109 --colors column:fg:236,86,109 --colors match:fg:115,210,22 '
let s:color5 = '--colors path:fg:57,229,143 --colors line:fg:57,143,229 --colors column:fg:57,143,229 --colors match:fg:115,210,22 '
let s:color = '--colors path:fg:57,229,229 --colors line:fg:57,143,229 --colors column:fg:57,143,229 --colors match:fg:115,210,22 '

function RgSearch(...)
   if (a:0 < 2)
      echoerr 'Insufficient arguments'
   end

   let l:search_exp = join(a:000[1:7], '.*')
   "echo 'Search exp is:' .l:search_exp
   call fzf#vim#grep('sbrg --ignore-file /hub/share/sbtools/etc/sbrg/sbrg-ignore.cfg -M 250'.
            \        ' --column --line-number --no-heading --color=always --smart-case '.s:color.
            \        l:search_exp. ' '.a:1, 1)
endfunction
nmap <Space>r :SearchPattern matlab/src
command! -bang -complete=dir -nargs=+ SearchPattern call RgSearch(<f-args>)

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


"command! -bang -nargs=* Mg call fzf#vim#ag_raw('-g '.<q-args>. ' matlab/src', fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
"command! -bang -nargs=* Mg call fzf#vim#ag_raw('-g '.<q-args>. ' matlab/src', <bang>0)
"command! -bang -nargs=* Sbrg
"         \ call fzf#vim#grep('sbrg --ignore-file /hub/share/sbtools/etc/sbrg/sbrg-ignore.cfg -M 250'.
"         \                   ' --column --line-number --no-heading --color=always --smart-case '.
"         \                   shellescape(<q-args>), 1, <bang>0)
