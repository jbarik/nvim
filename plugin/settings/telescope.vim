" :lua require'telescope.builtin'.buffers{ show_all_buffers = true }
" :Telescope buffers show_all_buffers=true
nmap <silent> <Space>sb :lua require'telescope.builtin'.buffers{show_all_buffers=true, previewer=false}<CR>
nmap <silent> <Space>tb :lua require'telescope.builtin'.buffers{show_all_buffers=true, previewer=false}<CR>
nmap <silent> <Space>tf :lua require'telescope.builtin'.find_files{show_all_buffers=true, previewer=false}<CR>
nmap <silent> <Space>th :lua require'telescope.builtin'.oldfiles{previewer=false}<CR>
nmap <silent> <Space>ts :lua require'telescope.builtin'.lsp_references<CR>

hi def link TelescopeSelection FzfCurline
hi TelescopeSelectionCaret guifg=#ff0066 gui=bold
hi TelescopeMultiSelection guifg=#928374 " multisections
hi def link TelescopeNormal FzfBg

" Border highlight groups.
hi TelescopeBorder         guifg=#ffffff guibg=#333e56
hi TelescopePromptBorder   guifg=#ffffff guibg=#333e56
hi TelescopeResultsBorder  guifg=#ffffff guibg=#333e56
hi TelescopePreviewBorder  guifg=#ffffff guibg=#333e56

" Used for highlighting characters that you match.
hi def link TelescopeMatching FzfMatch

" Used for the prompt prefix
highlight TelescopePromptPrefix   guifg=red

hi def link TelescopePreviewNormal FzfBg
hi def link TelescopeResultsLineNr FzfBg
