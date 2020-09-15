"let g:ccls_close_on_jump = v:true
let g:ccls_levels = 5
"let g:ccls_size = 50
"let g:ccls_position = 'botright'
"let g:ccls_orientation = 'horizontal'


" Debugging vim-ccls
" let g:ccls_log_file = expand('~/vim_ccls_log_file.txt')
"CclsBase              CclsCallHierarchy
"CclsBaseHierarchy     CclsCalleeHierarchy
"CclsCallees           CclsDerived           CclsMemberHierarchy   CclsVars
"CclsCallers           CclsDerivedHierarchy  CclsMembers

noremap <silent> <Space>rb :CclsBase<CR>
noremap <silent> <Space>rs :CclsDerived<CR>
noremap <silent> <Space>re :CclsCallees<CR>
noremap <silent> <Space>rl :CclsCallers<CR>

