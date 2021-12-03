nm <Space>w  :w<CR>
nm <Space>fw :w!<CR>
nm <Space>q  :q<CR>
nm <Space>fq :qa!<CR>

nm <Leader>en :e ~/.config/nvim/init.vim<CR>
nm <Leader>ek :e ~/.config/nvim/plugin/settings/generic_keymap.vim<CR>
nm <Leader>eg :e ~/.gdbinit<CR>

nm <Space>v <C-V>
nm <Space>n :nohls<CR>

nm <Space>fn :call ShowFuncName()<CR>
nm <silent> <Leader>n  :call ToggleRelativeNumber()<CR>
nm <silent> <Leader>cc :call ToggleColorColumn()<CR>
nn <silent> <leader>cl :set cuc!<Bar>set cursorline!<CR>

" * is primary i.e. middle-mouse-button-click
" + is clipboard
" copy current file full path
nn <Space>cf :let @*=expand("%:p") <bar> let @+=@*<CR>
" copy current file name, t for tail
nn <Space>ct :let @*=expand("%:t") <bar> let @+=@*<CR>
" copy current file relative path
"nn <Space>cr :let @*=expand("%") <bar> let @+=@*<CR>
nn <Space>cr :let @*=fnamemodify(expand("%"),":.") <bar> let @+=@*<CR>
" copy current file's directory name, h for head
nn <Space>cd :let @*=expand("%:p:h") <bar> let @+=@*<CR>
" copy file path under cursor
nn <Space>ccf :let @*=expand('<cfile>') <bar> let @+=@*<CR>

" paste from primary(middle click)
nm <Space>p "*p

" Copy the finename:line_no to system clipboard
" Helpful to use it in gdb - for breakpoints
" See http://vim.wikia.com/wiki/Get_the_name_of_the_current_file
"nn <Space>cn :let @*='b ' . expand("%:t") . ':' . line(".") <bar> let @+=@*<CR>
"nn <Space>cn :let @*='b ' . expand("%") . ':' . line(".") <bar> let @+=@*<CR>
nn <Space>cn :let @*='b ' . fnamemodify(expand("%"),":.") . ':' . line(".") <bar> let @+=@*<CR>

" Windows navigation
nn <Leader>j <C-W>j
nn <Leader>k <C-W>k
nn <Leader>h <C-W>h
nn <Leader>l <C-W>l

" Windows size
" + Increase height, - Decrease height
" > Increase width, > Decrease width
"nmap <Leader>+ <C-W>+
"nmap <Leader>- <C-W>-
"nmap <Leader>> <C-W>>
"nmap <Leader>< <C-W><

" Window resize instead of ctrl-w+- and ctrl-w++
nn <Leader>+ :exe "resize ".(winheight(0) * 3/2) <CR>
nn <Leader>- :exe "resize ".(winheight(0) * 2/3) <CR>

" Page navigation
nmap <Space>e $
nmap <Space>j <PageDown>
nmap <Space>k <PageUp>
nmap <Space>g <C-g>

" Cursor navigation
" H -> cursor to top of screen
" M -> cursor to middle of screen
" L -> cursor to bottom of screen

" Remove all trailing spaces
nm <F5> :%s/\s\+$//e<CR>

" Close quickfixwindow and location window
nn <Space>cl :cclose <bar> lcl<CR>

" Show leading whitespace
""nnoremap <Leader>s /\S\zs\s\+$<CR>
nn <Space>ss /\s\+$<CR>
nn <Space>st /\t<CR>

" Get the list of opened files
nn <F6> :read !p4 opened \| cut -f1 -d'\#' \| cut -f5-89 -d'/'<CR>

" The following map will exapnd the current files directory
" in the the ex command window so that you can open any
nnoremap <Leader>a :e <C-R>=expand('%:p:h') . '/'<CR>

tnoremap <C-n> <C-\><C-n>

" Go back <C-o>, go forward <C-i>
noremap <Leader>o <C-o>
noremap <Leader>i <C-i>

" Find out the highlight group of current word
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" This will insert date and time
" For format see: http://www.cplusplus.com/reference/ctime/strftime/
imap <F4> <C-R>=strftime("%d-%h-%Y %a %I:%M %p")<CR>
