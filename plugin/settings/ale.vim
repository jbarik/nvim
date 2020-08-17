let g:ale_linters = {
\   'javascript': ['eslint'],
\}
" \   'matlab': ['mlint'],


" Only run linters named in ale_linters settings.
"let g:ale_linters_explicit = 1
let g:ale_pattern_options = {
\   '.*\.cpp$': {'ale_enabled': 0},
\   '.*\.cxx$': {'ale_enabled': 0},
\   '.*\.c$': {'ale_enabled': 0},
\   '.*\.hpp$': {'ale_enabled': 0},
\   '.*\.h$': {'ale_enabled': 0},
\   '.*\.m$': {'ale_enabled': 0},
\}

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"" "sbperl /mathworks/AH/devel/sandbox/ciolfi/sbtools/sbcpptags -ccls-cmd
" let g:ale_cpp_ccls_init_options = {
" \   'cache': {
" \       'directory': working_dir. '/.sbtools/sbcpptags/ccls'
" \   },
" \   'clang': { 'pathMappings':
" \              ['/local-ssd/jbarik/Bmasklib.latest_pass.sbsyncmaster.inprogress/>'. working_dir. '/',
" \               '/local-ssd/jbarik/Bmasklib.latest_pass.sbsyncmaster/>'. working_dir. '/',
" \               '/local-ssd/jbarik/Bmasklib.latest_pass/>'. working_dir. '/']},
" \   'compilationDatabaseDirectory': working_dir. '/.sbtools/sbcpptags',
" \   'completion': {'detailedLabel': v:false},
" \   'index': {
" \        'threads':12,
" \        'trackDependency':0
" \   }
" \ }
