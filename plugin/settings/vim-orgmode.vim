let g:org_aggressive_conceal = 1
let g:org_heading_shade_leading_stars = 1

let g:org_todo_keywords = [['TODO', 'DISCUSS', 'WAITING', '|', 'DONE'],
         \ ['|', 'CANCELED']]
"let g:org_todo_keyword_faces = [['TODO', [':foreground red', ':weight bold']]]

" Next setting is not really for vim-orgmode, but for utl - plugin which
" vim-orgmode uses
let g:utl_cfg_hdl_scm_http_system = "silent !firefox -remote 'ping()' && firefox -remote 'openURL( %u )' || firefox '%u#%f' &"
