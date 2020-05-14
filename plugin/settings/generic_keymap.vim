nmap <Space>w  :w<CR>
nmap <Space>ww :w!<CR>

nmap <Leader>se :e ~/.config/nvim/init.vim<CR>

nnoremap <Space>v V
nmap <Space><Space> <C-V>
nmap <Leader><Space> :nohls<CR>

" paste from primary/system clipboard
nmap <Space>p "*p

nmap <Leader>ff :call ShowFuncName()<CR>
nmap <silent> <Leader>n  :call ToggleRelativeNumber()<CR>
nmap <silent> <Leader>cc :call ToggleColorColumn()<CR>
nnoremap <silent> <leader>cl :set cuc!<Bar>set cursorline!<CR>

" copy current file relative path
nmap <Leader>cr :let @*=expand("%")<CR>

" copy current file full path
nmap <Leader>cf :let @*=expand("%:p")<CR>

" copy current file name
nmap <Leader>ct :let @*=expand("%:t")<CR>

" copy current file's directory name
nmap <Leader>cd :let @*=expand("%:p:h")<CR>


" Windows navigation
nmap <Leader>j <C-W>j
nmap <Leader>k <C-W>k
nmap <Leader>h <C-W>h
nmap <Leader>l <C-W>l

" Windows size
" + Increase height, - Decrease height
" > Increase width, > Decrease width
nmap <Leader>i <C-W>+
nmap <Leader>d <C-W>-
nmap <Leader>> <C-W>>
nmap <Leader>< <C-W><

" Window resize instead of ctrl-w+- and ctrl-w++
"nnoremap <silent> + :exe "resize ".(winheight(0) * 3/2) <CR>
"nnoremap <silent> - :exe "resize ".(winheight(0) * 2/3) <CR>


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

" Get the list of opened files
nnoremap <F6> :read !p4 opened \| cut -f1 -d'\#' \| cut -f5-89 -d'/'<CR>

" The following map will exapnd the current files directory
" in the the ex command window so that you can open any
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" Copy the finename:line_no to system clipboard
" Helpful to use it in gdb - for breakpoints
"
" See http://vim.wikia.com/wiki/Get_the_name_of_the_current_file
nnoremap <Space>n :let @*='b ' . expand("%:t") . ':' . line(".")<CR>

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