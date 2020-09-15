let s:ccls_enabled = isdirectory(working_dir . '/.sbtools/sbcpptags/ccls')
if s:ccls_enabled
   let g:ycm_filetype_whitelist = {'python' : 1}
   let g:ycm_filetype_blacklist = {'cpp': 1, 'c':1}
else
   echo "Turning on ycm with clangd"
   let g:ycm_use_clangd = 1

   let g:ycm_confirm_extra_conf = 1
   let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf_mw.py'
   let g:ycm_complete_in_comments_and_strings = 1

   let g:ycm_filetype_whitelist = {'cpp':1, 'c':1, 'python' : 1}
   " With the following setting YCM always populates vim location list
   " with diagnostic data, and one can jump with :lnext :lprevious
   " short is :lne :lp
   "let g:ycm_always_populate_location_list = 1

   let g:ycm_max_diagnostics_to_display = 2000

   "let g:ycm_add_preview_to_completeopt = 1
   "let g:ycm_autoclose_preview_window_after_completion = 0
   let g:ycm_autoclose_preview_window_after_insertion = 1
   let g:ycm_error_symbol = '✘'
   let g:ycm_warning_symbol = '⚠'

   noremap <silent> <Space>rj :YcmCompleter GoToDefinition<CR>
   noremap <silent> <Space>rJ :YcmCompleter GoToDeclaration<CR>
   noremap <silent> <Space>rf :YcmCompleter GoToReferences<CR>
   noremap <silent> <Space>rs :YcmCompleter<CR>
   noremap <silent> <Space>rv :YcmCompleter GoToImplementation<CR>
   noremap <silent> <Space>rd :YcmDiags<CR>
   noremap <silent> <Space>rn :YcmCompleter RefactorRename<CR>
   noremap <silent> <Space>rx :YcmCompleter FixIt<CR>
   autocmd FileType c,cpp nmap K :YcmGetDocFloatWin<cr>
   "noremap <silent> <Leader>ri :YcmCompleter GetDoc<CR>
end

function s:Hover()
    let response = youcompleteme#GetCommandResponse('GetDoc')
    call ShowTextInFloatingWindow(response)
endfunction

command YcmGetDocFloatWin :call <SID>Hover()

" "ycm log level debug, info, warning, error, critical
" let g:ycm_log_level = 'critical'
" let g:ycm_server_keep_logfiles = 0
" let g:ycm_server_use_vim_stdout = 0

" "Ycm debuging settings
" let g:ycm_log_level = 'debug'
" let g:ycm_server_log_level = 'debug'
" let g:ycm_server_use_vim_stdout = 1
" let g:ycm_server_keep_logfiles = 1
"
" let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python' : 1, 'text' : 1}
" let g:ycm_filetype_blacklist = {'tagbar': 1}
"
" if isdirectory(working_dir . '/.sbtools/sbcpptags/ccls')
"    echo "Turning on ycm with ccls"
"    let g:ycm_use_clangd = 0
"    let s:ccls_args =  '--init={"cache":{"directory":"' . working_dir. '/..sbtools/sbcpptags/ccls"},'
"             \ . '"clang":{"pathMappings":["/local-ssd/jbarik/.Bmasklib.latest_pass.sbsyncmaster.inprogress/>'
"             \ . working_dir. '/","/local-ssd/jbarik/.Bmasklib.latest_pass.sbsyncmaster/>'
"             \ . working_dir. '/","/local-ssd/jbarik/Bmasklib.latest_pass/>' . working_dir . '/"]},'
"             \ . '"compilationDatabaseDirectory":"' . working_dir . '/.sbtools/sbcpptags",'
"             \ . '"index":{"threads":12,"trackDependency":0}, "completion": {"detailedLabel":false}}'
"
"    let g:ycm_language_server =
"             \ [{
"             \   'name': 'ccls',
"             \   'cmdline': [ 'ccls', s:ccls_args ],
"             \   'filetypes': [ 'c', 'cpp', 'cuda', 'objc', 'objcpp' ]
"             \ }]
" else
"    echo "Turning on ycm with clangd"
"    let g:ycm_use_clangd = 1
" end
