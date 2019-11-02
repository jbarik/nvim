
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
