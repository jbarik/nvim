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

noremap <silent> <Leader>rb :CclsBase<CR>
noremap <silent> <Leader>rd :CclsDerived<CR>
noremap <silent> <Leader>rce :CclsCallees<CR>
noremap <silent> <Leader>rce :CclsCallers<CR>

