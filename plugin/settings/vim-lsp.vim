" Register ccls C++ lanuage server.
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'initialization_options': {
      \     'cache': {'directory': working_dir. '/.sbtools/sbcpptags/ccls'},
      \     'compilationDatabaseDirectory': working_dir. '/.sbtools/sbcpptags',
      \     'index': {'threads':12, 'trackDependency':0}
      \  },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

" \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},

" This options makes a fresh request for a request e.g. hover info
let g:lsp_preview_doubletap = 0

let g:lsp_diagnostics_enabled = 0
let g:lsp_text_edit_enabled = 0
let g:lsp_fold_enabled = 0

if isdirectory(working_dir . '/.sbtools/sbcpptags/ccls')
   echo "ccls found"
   echo working_dir
   let g:lsp_async_completion = 1
   autocmd FileType c setlocal omnifunc=lsp#complete
   autocmd FileType cpp setlocal omnifunc=lsp#complete
   autocmd FileType objc setlocal omnifunc=lsp#complete
   autocmd FileType objcpp setlocal omnifunc=lsp#complete
end

noremap <Leader>rj :LspDefinition<CR>
noremap <Leader>rJ :LspDeclaration<CR>
noremap <Leader>rf :LspReferences<CR>
noremap <Leader>ri :LspHover<CR>
noremap <Leader>rs :LspWorkspaceSymbol<CR>
noremap <Leader>rv :LspImplementation<CR>


" Go back <C-o>, go forward <C-i>
noremap <Leader>o <C-o>
noremap <Leader>i <C-i>

"" Debugging vim-lsp
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')
"
"" for asyncomplete.vim log
"let g:asyncomplete_log_file = expand('~/asyncomplete.log')

