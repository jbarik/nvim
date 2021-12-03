if g:use_nvim_lsp == 1
   finish
end

au User lsp_setup call lsp#register_server(
         \ {'name': 'matlab', 'cmd': {server_info->['lsp_matlab']},
         \   'allowlist': ['matlab']})

au User lsp_setup call lsp#register_server(
         \ {'name': 'pyright', 'cmd': {server_info->['pyright-langserver', '--stdio']},
         \   'allowlist': ['python']})

autocmd FileType matlab,python noremap <silent> <Space>rj :LspDefinition<CR>
autocmd FileType matlab,python noremap <silent> <Space>rJ :LspDeclaration<CR>
autocmd FileType matlab,python noremap <silent> <Space>rf :LspReferences<CR>
autocmd FileType matlab,python noremap <silent> <Space>rs :LspWorkspaceSymbol<CR>
autocmd FileType matlab,python noremap <silent> <Space>rv :LspImplementation<CR>
autocmd FileType matlab,python noremap <silent> <Space>rp :LspPeekDefinition<CR>
autocmd FileType matlab,python noremap <silent> <Space>rd :LspDocumentDiagnostics<CR>
autocmd FileType matlab,python noremap <silent> <Space>rd :LspDocumentDiagnostics<CR>
autocmd FileType matlab,python noremap <silent> ]d :LspNextDiagnostic<CR>
autocmd FileType matlab,python noremap <silent> [d :LspPreviousDiagnostic<CR>

if g:use_ycm
   echo "Enabling vim-lsp for python & matlab"
   finish
else
   echo "Enabling vim-lsp for python, matlab and cpp"
end

if g:local_sb

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
elseif !g:use_ycm
   let s:clangd_args =  '--background-index -j=12 --clang-tidy --completion-style=detailed'
   au User lsp_setup call lsp#register_server({
            \ 'name': 'clangd', 'cmd': ['clangd', s:clangd_args],
            \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp']
            \ })
end

let g:lsp_fold_enabled = 0
let g:lsp_text_edit_enabled = 0
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_work_done_progress_enabled  = 0

" This options makes a fresh request for a request e.g. hover info
let g:lsp_preview_doubletap = 0

" ✘ ✗ ✖ ⛛  ☠ ☢ ℹ
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 0
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_signs_hint = {'text': 'ℍ'}
let g:lsp_diagnostics_signs_error = {'text': '✘'}
let g:lsp_diagnostics_signs_warning = {'text': '⚠'}
let g:lsp_diagnostics_signs_information = {'text': 'ⅈ'}
let g:lsp_diagnostics_highlights_insert_mode_enabled = 0
"let g:lsp_diagnostics_signs_hint = {'icon': '/path/to/some/other/icon'} " icons require GUI

let g:lsp_signature_help_enabled = 1
let g:lsp_document_highlight_enabled = 0
let g:lsp_async_completion = 0
let g:lsp_hover_conceal = 0
let g:lsp_log_verbose = 0

autocmd FileType cpp,c noremap <silent> <Space>rj :LspDefinition<CR>
autocmd FileType cpp,c noremap <silent> <Space>rJ :LspDeclaration<CR>
autocmd FileType cpp,c noremap <silent> <Space>rf :LspReferences<CR>
autocmd FileType cpp,c noremap <silent> <Space>rs :LspWorkspaceSymbol<CR>
autocmd FileType cpp,c noremap <silent> <Space>rv :LspImplementation<CR>
autocmd FileType cpp,c noremap <silent> <Space>rp :LspPeekDefinition<CR>
autocmd FileType cpp,c noremap <silent> <Space>rd :LspDocumentDiagnostics<CR>
autocmd FileType cpp,c noremap <silent> K :LspHover<CR>
autocmd FileType cpp,c noremap <silent> ]d :LspNextDiagnostic<CR>
autocmd FileType cpp,c noremap <silent> [d :LspPreviousDiagnostic<CR>

"let g:lsp_highlight_references_enabled = 0
" Debugging vim-lsp
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')

