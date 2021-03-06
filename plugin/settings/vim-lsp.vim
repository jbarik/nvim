let s:ccls_enabled = isdirectory(working_dir . '/.sbtools/sbcpptags/ccls')
" if !s:ccls_enabled
"    return
" end
if  use_nvim_lsp
   let s:ccls_enabled = 0
end

if s:ccls_enabled
   echo "Enabling vim-lsp with ccls"

   "let s:ccls_args =  '--init={"cache":{"directory":"' . working_dir. '/.sbtools/sbcpptags/ccls"},'
   "         \ . '"clang":{"pathMappings":["/local-ssd/jbarik/.Bmasklib.latest_pass.sbsyncmaster.inprogress/>'
   "         \ . working_dir. '/","/local-ssd/jbarik/.Bmasklib.latest_pass.sbsyncmaster/>'
   "         \ . working_dir. '/","/local-ssd/jbarik/Bmasklib.latest_pass/>' . working_dir . '/"]},'
   "         \ . '"compilationDatabaseDirectory":"' . working_dir . '/.sbtools/sbcpptags",'
   "         \ . '"index":{"threads":12,"trackDependency":0}, "completion": {"detailedLabel":false}}'
   let s:ccls_args =  '--init={"cache":{"directory":"' . working_dir. '/.sbtools/sbcpptags/ccls"},'
            \ . '"clang":{"pathMappings":["/local-ssd/jbarik/.Bmasklib.latest_pass.sbsyncmaster.inprogress/>'
            \ . working_dir. '/","/local-ssd/jbarik/.Bmasklib.latest_pass.sbsyncmaster/>'
            \ . working_dir. '/","/local-ssd/jbarik/Bmasklib.latest_pass/>' . working_dir . '/"]},'
            \ . '"compilationDatabaseDirectory":"' . working_dir . '/.sbtools/sbcpptags",'
            \ . '"diagnostics":{"onOpen":0,"onChange":-1,"onSave":0},'
            \ . '"index":{"threads":12,"trackDependency":0}}'
   au User lsp_setup call lsp#register_server({
            \ 'name': 'ccls', 'cmd': ['ccls', s:ccls_args],
            \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp']
            \ })

   au User lsp_setup call lsp#register_server(
            \ {'name': 'matlab', 'cmd': {server_info->['lsp_matlab']},
            \   'allowlist': ['matlab']})

   let g:lsp_fold_enabled = 0
   let g:lsp_text_edit_enabled = 0
   let g:lsp_diagnostics_enabled = 1
   let g:lsp_virtual_text_enabled = 0
   let g:lsp_diagnostics_echo_cursor = 0
   let g:lsp_diagnostics_float_cursor = 1

   " This options makes a fresh request for a request e.g. hover info
   let g:lsp_preview_doubletap = 0

   " ✘ ✗ ✖ ⛛  ☠ ☢
   let g:lsp_signs_error = {'text': '✘'}
   let g:lsp_signs_warning = {'text': '⚠'}
   "let g:lsp_signs_hint = {'icon': '/path/to/some/other/icon'} " icons require GUI

   let g:lsp_async_completion = 1
   let g:lsp_signature_help_enabled = 1
   "autocmd FileType matlab setlocal omnifunc=lsp#complete
   let g:lsp_highlight_references_enabled = 0

   noremap <silent> <Space>rj :LspDefinition<CR>
   noremap <silent> <Space>rJ :LspDeclaration<CR>
   noremap <silent> <Space>rf :LspReferences<CR>
   noremap <silent> <Space>rs :LspWorkspaceSymbol<CR>
   noremap <silent> <Space>rv :LspImplementation<CR>
   noremap <silent> <Space>rp :LspPeekDefinition<CR>
   noremap <silent> <Space>rd :LspDocumentDiagnostics<CR>
   "noremap <silent> <Leader>ri :LspHover<CR>
   autocmd FileType cpp,c,matlab noremap <silent> K :LspHover<CR>
end

"  " Debugging vim-lsp
"  let g:lsp_log_verbose = 1
"  let g:lsp_log_file = expand('~/vim-lsp.log')
"
"  " for asyncomplete.vim log
"  "" let g:asyncomplete_log_file = expand('~/asyncomplete.log')
"
"  "if isdirectory(working_dir . '/.sbtools/sbcpptags/ccls')
"  "   echo "ccls found"
"  "   let g:lsp_async_completion = 1
"  "   autocmd FileType c setlocal omnifunc=lsp#complete
"  "   autocmd FileType cpp setlocal omnifunc=lsp#complete
"  "   autocmd FileType objc setlocal omnifunc=lsp#complete
"  "   autocmd FileType objcpp setlocal omnifunc=lsp#complete
"  "end
