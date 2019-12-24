if isdirectory(working_dir . '/.sbtools/sbcpptags/ccls')
   let ftToIgnore = []
else
   let ftToIgnore = ['cpp', 'c']
end

autocmd BufEnter * if index(ftToIgnore, &ft) < 0 | call ncm2#enable_for_buffer()

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
