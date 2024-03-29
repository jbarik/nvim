let g:fzf_preview_window = '' " Disable preview
nmap <silent> <Space>fb :Buffer<CR>
"nmap <silent> <Space>h :History<CR> " By default history shows preview
nmap <silent> <Space>fh :call fzf#vim#history({})<CR>
nnoremap <silent> <Space>ff :Files <C-r>=expand("%:h")<CR>/<CR>
nnoremap <silent> <Space>fl :Lines<CR>

let g:fzf_use_fdfind = 0
let s:find_command = 'find '
let s:find_options = ' -type d'
function! FindToggle()
    if g:fzf_use_fdfind
       let g:fzf_use_fdfind = 0
       let s:find_command = 'find '
       let s:find_options = ' -type d'
    else
       let g:fzf_use_fdfind = 1
       let s:find_command = 'fdfind --type d --full-path '
       let s:find_options = ''
    endif
endfunction

"================================================================================
function AgSearchFile(...)
   if (a:0 < 2)
      echoerr 'Insufficient arguments'
   end
   let l:search_exp = join(a:000[1:7], '.*')

   call fzf#run(fzf#wrap({'source':'ag --nogroup --column -g' .l:search_exp. ' ' .a:1,
         \                        'sink':'e',
         \                        'options':['--ansi', '--multi']}))
endfunction

nmap <Space>fa :SearchFile matlab/src
command! -bang -complete=dir -nargs=+ SearchFile call AgSearchFile(<f-args>)
"================================================================================

"================================================================================
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

nmap <Space>fp :SearchPattern matlab/src
command! -bang -complete=dir -nargs=+ SearchPattern call RgSearch(<f-args>)
"================================================================================

"========================================================================
function TriggerFileSearch(selectedLine)
   call fzf#vim#files(a:selectedLine)
   "call feedkeys('i', 'n')
endfunction

function! DirSearch(...)
   if (a:0 > 1)
      echoerr 'Too many arguments'
   end

   call fzf#run(fzf#wrap({
            \ 'options': ['--prompt', a:1.'> '],
            \ 'source': s:find_command .a:1. s:find_options,
            \ 'sink': function('TriggerFileSearch')}))
endfunction

nmap <Space>fd :SearchDir matlab/
command! -bang -complete=dir -nargs=+ SearchDir call DirSearch(<f-args>)
"========================================================================

"========================================================================
function FileNavigationGeneric(filepath)
   if (empty(glob(a:filepath)))
      echo 'Returning'
      return
   end

   if(isdirectory(a:filepath))
      echo 'Diving inside' .a:filepath
      call DiveInDir(a:filepath)
   else
      edit a:filepath
   end
endfunction

function DiveInDir(dirpath)
   echo 'source command: find ' .a:dirpath. ' -maxdepth 1'
   call fzf#run(fzf#wrap({'options':['--prompt', a:dirpath.'> '],
                        \ 'source': 'find ' .a:dirpath. ' -maxdepth 1',
                        \ 'sink': function('FileNavigationGeneric')
                        \ }))
endfunction
"========================================================================

" See for more info: https://github.com/junegunn/fzf/wiki/Color-schemes
let g:fzf_colors =
\ { 'hl':      ['fg', 'FzfMatch'],
  \ 'fg+':     ['fg', 'FzfCurline'],
  \ 'bg':      ['bg', 'FzfBg'],
  \ 'bg+':     ['bg', 'FzfBg'],
  \ 'hl+':     ['fg', 'FzfMatch'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }
function! OpenFloatingWin()
  let height = &lines - 10
  let width = &columns - 10
  let col = 5

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 5,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  "Set Floating Window Highlighting
  "call setwinvar(win, '&winhl', 'Normal:Pmenu')
  "call nvim_win_set_option(win, 'winhl', 'Normal:Pmenu,NormalNC:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

