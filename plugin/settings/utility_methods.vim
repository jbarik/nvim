"set colorcolumn and settings. Keep the width at 85 column and set the colors
"let &colorcolumn=join(range(85,999),",")
"Method to toggle colorcolumn
function! g:ToggleColorColumn()
    if &colorcolumn !=''
        set colorcolumn&
    else
        set colorcolumn=85
    endif
endfunction

"Show the current function name
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun

function! ToggleRelativeNumber()
   if &relativenumber
      set norelativenumber
   else
      set relativenumber
   endif
endfunction

" See the following link for lua implementation of floating window
"https://gabrielpoca.com/2019-11-13-a-bit-more-lua-in-your-vim/
function ShowTextInFloatingWindow(text)
    if a:text == ''
        return
    endif
    " set the width
    let s:width = min([winwidth('%') * 9 / 10, 100])
    " calculate the height to show the whole doc with wrap enabled
    let lines = split(a:text, '\n')
    let s:height = len(lines) + 1
    for s:line in lines
        let s:height = s:height + len(s:line) / s:width
    endfor
    " nvim floating window interface
    let buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(buf, 0, -1, v:true, lines)
    let opts = {'relative': 'cursor', 'width': s:width, 'height': len(lines) + 1, 'col': 1,
                \ 'row': 0, 'anchor': 'SW', 'style': 'minimal'}
    let s:win = nvim_open_win(buf, 0, opts)
    " set the window option
    call nvim_win_set_option(s:win, 'winhl', 'Normal:NormalFloat')
    call nvim_win_set_option(s:win, 'wrap', v:true)
    call nvim_win_set_option(s:win, 'linebreak', v:true)
    " close the window once the cursor moved
    autocmd CursorMoved <buffer> ++once call nvim_win_close(s:win, v:false)
endfunction

" Rename the current file
function! Rename()
  let current = expand('%')
  let new_file = input('New name: ', current)
  if new_file != current && new_file != ''
    exec ':saveas ' . new_file
    exec ':silent !rm ' . current
    redraw!
  endif
endfunction

