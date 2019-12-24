" Register ccls C++ lanuage server.
if isdirectory(working_dir . '/.sbtools/sbcpptags/ccls')
   if executable('ccls')
      au User lsp_setup call lsp#register_server({
               \ 'name': 'ccls',
               \ 'cmd': {server_info->['ccls']},
               \ 'initialization_options': {
               \     'cache': {'directory': working_dir. '/.sbtools/sbcpptags/ccls'},
               \     'clang': { 'pathMappings':
               \                ['/local-ssd/jbarik/Bmasklib.latest_pass.sbsyncmaster.inprogress/>'. working_dir. '/',
               \                 '/local-ssd/jbarik/Bmasklib.latest_pass.sbsyncmaster/>'. working_dir. '/',
               \                 '/local-ssd/jbarik/Bmasklib.latest_pass/>'. working_dir. '/']},
               \     'compilationDatabaseDirectory': working_dir. '/.sbtools/sbcpptags',
               \     'completion': {'detailedLabel': v:false},
               \     'index': {'threads':12, 'trackDependency':0}
               \  },
               \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
               \ })
   endif
end

let g:lsp_fold_enabled = 0
let g:lsp_text_edit_enabled = 0
let g:lsp_diagnostics_enabled = 1
let g:lsp_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1

" This options makes a fresh request for a request e.g. hover info
let g:lsp_preview_doubletap = 0

"if isdirectory(working_dir . '/.sbtools/sbcpptags/ccls')
"   echo "ccls found"
"   let g:lsp_async_completion = 1
"   autocmd FileType c setlocal omnifunc=lsp#complete
"   autocmd FileType cpp setlocal omnifunc=lsp#complete
"   autocmd FileType objc setlocal omnifunc=lsp#complete
"   autocmd FileType objcpp setlocal omnifunc=lsp#complete
"end

noremap <silent> <Leader>rj :LspDefinition<CR>
noremap <silent> <Leader>rJ :LspDeclaration<CR>
noremap <silent> <Leader>rf :LspReferences<CR>
noremap <silent> <Leader>ri :LspHover<CR>
noremap <silent> <Leader>rs :LspWorkspaceSymbol<CR>
noremap <silent> <Leader>rv :LspImplementation<CR>


" Go back <C-o>, go forward <C-i>
noremap <Leader>o <C-o>
noremap <Leader>i <C-i>

"" Debugging vim-lsp
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')
"
"" for asyncomplete.vim log
"let g:asyncomplete_log_file = expand('~/asyncomplete.log')

