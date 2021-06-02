
let s:text_dict = {
         \'1.  Callstack: Join broken lines'         : '%s/\(^#[0-9]\{1,\} .*\)\n\([^#].*$\)/\1\2/g',
         \'2.  Callstack: Remove all pointers '      : '%s/\<\w*0x\w*\>//g',
         \'3.  Callstack: Remove fcn address'        : '%s/\(#[0-9]* *\)\(0x.*in \)/\1/g',
         \'4.  Callstack: Shorten paths'             : '%s/\(#.*at \)\/.*\(\/matlab\/.*\)/\1\2/',
         \'5.  Callstack: Shorten export paths'      : '%s/\(at \)\(\/.*\)\(\/matlab\/.*\)/\1\3/',
         \'6.  Callstack: Remove fcn arguments '     : '%s/\/.*\(\/matlab\/\)\(.*(.*\)/\/\.\*\1\2/g',
         \'7.  Block name: Replace new line with \n' : '%s/\(BLOCK_NAME: "[^"]* *\)\n/\1\\n/<bar>:%s/\(\n\n\)\n\+/\1/g',
         \'8.  Block name: Replace new line - old'   : '%s/\(BLOCK_NAME: "[^"]* *\)\n/\1\\n/g',
         \'9.  Replace character \n with new line'   : '%s/\\n/\r/g',
         \'10. Remove trailing white space'          : '%s/\s\+$//'
         \}

let s:ccls_dict = {
         \ '1.  Ccls: Base hierarchy':    'CclsBaseHierarchy',
         \ '2.  Ccls: Derived hierarchy': 'CclsDerivedHierarchy',
         \ '3.  Ccls: Callers          ': 'CclsCallers',
         \ '4.  Ccls: Caller hierarchy':  'CclsCallerHierarchy',
         \ '5.  Ccls: Callees':           'CclsCalees',
         \ '6.  Ccls: Callee hierarchy':  'CclsCaleeHierarchy'
         \}

let s:config_dict = {
         \ '1.  cshrc.mine'   : 'e ~/.cshrc.mine',
         \ '2.  aliases.mine' : 'e ~/.aliases.mine',
         \ '3.  init.vim'     : 'e ~/.config/nvim/init.vim',
         \ '4.  vimrc'        : 'e ~/.vimrc'
         \}

let s:ycm_dict = {
         \ '1.  Ycm: GoTo'           : 'YcmCompleter GoTo',
         \ '2.  Ycm: GoToDefinition' : 'YcmCompleter GoToDefinition',
         \ '3.  Ycm: GoToDeclration' : 'YcmCompleter GoToDeclration',
         \ '4.  Ycm: GetType'        : 'YcmCompleter GetType',
         \ '5.  Ycm: FixIt'          : 'YcmCompleter FixIt',
         \ '6.  Ycm: GetParent'      : 'YcmCompleter GetParent',
         \ '7.  Ycm: GetDoc'         : 'YcmCompleter GetDocParent',
         \ '8.  Ycm: Get imprecise doc': 'YcmCompleter GetDocImprecise',
         \}

function HandleTextPruneSubmenu(sm)
   execute  s:text_dict[a:sm[0]]
endfunction

function HandleCclsSubmenu(sm)
   execute  s:ccls_dict[a:sm[0]]
endfunction

function HandleConfigSubmenu(sm)
   execute  s:config_dict[a:sm[0]]
endfunction

function HandleYcmSubmenu(sm)
   execute  s:ycm_dict[a:sm[0]]
endfunction

function TriggerSubmenu(sm)
   "let l:submenu_id = split(a:sm[0])[0]
   if (strpart(a:sm[0],0,2) == '1.')
      let l:source = keys(s:text_dict)
      call fzf#run(fzf#wrap({'source': l:source, 'sink*': function('HandleTextPruneSubmenu')}))
      "call feedkeys('i', 'n')

   elseif (strpart(a:sm[0], 0,2) == '2.')
      let l:source = keys(s:ccls_dict)
      call fzf#run(fzf#wrap({'source': reverse(l:source), 'sink*': function('HandleCclsSubmenu')}))
      "call feedkeys('i', 'n')

   elseif (strpart(a:sm[0],0,2) == '3.')
      let l:source = keys(s:config_dict)
      call fzf#run(fzf#wrap({'source': reverse(l:source), 'sink*': function('HandleConfigSubmenu')}))
      "call feedkeys('i', 'n')

   elseif (strpart(a:sm[0],0,2) == '4.')
      let l:source = keys(s:ycm_dict)
      call fzf#run(fzf#wrap({'source': reverse(l:source), 'sink*': function('HandleYcmSubmenu')}))
      "call feedkeys('i', 'n')
   endif

   "let l:source = 'Submenu for:' .l:submenu_id
endfunction

function CustomMenu()
   let l:menu_options = ['1. Prune text',
                       \ '2. Ccls commands',
                       \ '3. Edit configs',
                       \ '4. Ycm commands']
   call fzf#run(fzf#wrap({'source': reverse(l:menu_options),'sink*': function('TriggerSubmenu')}))
endfunction
nmap <Space>m :call CustomMenu()<CR>
