nmap <Space>w  :w<CR>
nmap <Space>ww :w!<CR>

nmap <Leader>se :e ~/.config/nvim/init.vim<CR>

nnoremap <Space>v V
nmap <Space><Space> <C-V>
nmap <Leader><Space> :nohls<CR>

nmap <Leader>ff :call ShowFuncName()<CR>
nmap <Leader>n  :call ToggleRelativeNumber()<CR>
nmap <Leader>cc :call ToggleColorColumn()<CR>
nnoremap <silent> <leader>cl :set cuc!<Bar>set cursorline!<CR>

" Windows navigation
nmap <Leader>j <C-W>j
nmap <Leader>k <C-W>k
nmap <Leader>h <C-W>h
nmap <Leader>l <C-W>l

" Windows size
" + Increase height, - Decrease height
" > Increase width, > Decrease width
nmap <Space>+ <C-W>+
nmap <Space>- <C-W>-
nmap <Space>> <C-W>>
nmap <Space>< <C-W><

" Page navigation
nmap <Space>e $
nmap <Space>j <PageDown>
nmap <Space>k <PageUp>

" Cursor navigation
" H -> cursor to top of screen
" M -> cursor to middle of screen
" L -> cursor to bottom of screen

" Remove all trailing spaces
nmap <F5> :%s/\s\+$//e<CR>

" Close quickfixwindow
nnoremap <Space>c :cclose<CR>

" Show leading whitespace
""nnoremap <Leader>s /\S\zs\s\+$<CR>
nnoremap <Space>s /\s\+$<CR>
nnoremap <Space>t /\t<CR>

" The following map will exapnd the current files directory
" in the the ex command window so that you can open any
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" Copy the finename:line_no to system clipboard
" Helpful to use it in gdb - for breakpoints
"
" See http://vim.wikia.com/wiki/Get_the_name_of_the_current_file
nnoremap <Space>ln :let @*='b ' . expand("%:t") . ':' . line(".")<CR>

tnoremap <C-n> <C-\><C-n>


