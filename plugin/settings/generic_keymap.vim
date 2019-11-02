nmap <Space>w  :w<CR>
nmap <Space>ww :w!<CR>

nmap <Leader>se :e ~/.config/nvim/init.vim<CR>

nmap <Space><Space> <C-V>
nmap <Leader><Space> :nohls<CR>

nmap <Leader>ff :call ShowFuncName()<CR>
nmap <Leader>n  :call ToggleRelativeNumber()<CR>
nmap <Leader>cc :call ToggleColorColumn()<CR>

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

" Remove all trailing spaces
nmap <F5> :%s/\s\+$//e<CR>
