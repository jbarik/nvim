if stridx(working_dir, '/mathworks/devel/sbs/') == 0 || stridx(working_dir, '/sandbox/') == 0
   let g:compe = {}
   let g:compe.enabled = v:false
else
   let g:compe = {}
   let g:compe.enabled = v:true
   let g:compe.autocomplete = v:true
   let g:compe.debug = v:false

   let g:compe.source = {}
   let g:compe.source.path = v:true
   let g:compe.source.buffer = v:true
   let g:compe.source.calc = v:true
   "let g:compe.source.vsnip = v:true
   "let g:compe.source.nvim_lsp = v:true
   let g:compe.source.vim_lsp = v:true
   let g:compe.source.nvim_lua = v:true
   let g:compe.source.spell = v:true
   let g:compe.source.tags = v:true
   "let g:compe.source.snippets_nvim = v:true
   "let g:compe.source.treesitter = v:true
   let g:compe.source.omni = v:false
end
