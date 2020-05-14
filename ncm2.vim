if isdirectory(working_dir . '/.sbtools/sbcpptags/ccls')
   let ftToIgnore = ['python']
else
   let ftToIgnore = ['cpp', 'c', 'python']
end

autocmd BufEnter * if index(ftToIgnore, &ft) < 0 | call ncm2#enable_for_buffer()

"let g:ncm2#matcher = 'substrfuzzy'
let g:ncm2#matcher = {'name': 'combine',
                     \'matchers': [{'name': 'abbrfuzzy'}, {'name': 'substrfuzzy'}]
                     \}
