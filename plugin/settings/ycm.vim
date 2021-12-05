if !g:use_ycm
   finish
end

echo "Turning on ycm with clangd"
let g:ycm_filetype_blacklist = {'python': 1, 'matlab':1}
let g:ycm_filetype_whitelist = {'cpp': 1, 'c':1}
let g:ycm_use_clangd = 1
let g:ycm_clangd_binary_path = '/usr/bin/clangd-13'
let g:ycm_use_ultisnips_completer = 0
let g:ycm_confirm_extra_conf = 1
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf_mw.py'
let g:ycm_complete_in_comments_and_strings = 1

"let g:ycm_filetype_whitelist = {'cpp':1, 'c':1, 'python' : 1}
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

autocmd FileType cpp,c nmap <silent> <Space>rj :YcmCompleter GoToDefinition<CR>
autocmd FileType cpp,c nmap <silent> <Space>rJ :YcmCompleter GoToDeclaration<CR>
autocmd FileType cpp,c nmap <silent> <Space>rf :YcmCompleter GoToReferences<CR>
autocmd FileType cpp,c nmap <silent> <Space>rs :YcmCompleter<CR>
autocmd FileType cpp,c nmap <silent> <Space>rv :YcmCompleter GoToImplementation<CR>
autocmd FileType cpp,c nmap <silent> <Space>rd :YcmDiags<CR>
autocmd FileType cpp,c nmap <silent> <Space>rn :YcmCompleter RefactorRename<CR>
autocmd FileType cpp,c nmap <silent> <Space>rx :YcmCompleter FixIt<CR>
autocmd FileType cpp,c nmap <silent> K :YcmGetDocFloatWin<cr>
"noremap <silent> <Leader>ri :YcmCompleter GetDoc<CR>

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
let g:ycm_log_level = 'debug'
let g:ycm_server_log_level = 'debug'
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_keep_logfiles = 1
