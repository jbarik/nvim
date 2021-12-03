" When the completion window is visible, the tab key will select
" the next candidate in the window.
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" This selects the previous candidate for shift-tab
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"When the <Enter> key is pressed while the popup menu is visible, it only
"hides the menu. Use this mapping to close the menu and also start a new line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

"set completeopt=menu,menuone,longest,preview
"set completeopt=menu,menuone,longest,previewpopup
set completeopt=noinsert,menuone,noselect

" wildmode list::longest,full expands the suggestions in command line
set wildmode=list:longest,full
set wildmenu

" Makes floating PopUpMenu for completing stuff on the command line.
" Very similar to completing in insert mode.
"set wildoptions+=pum
"

" see https://github.com/n3wborn/nvim/blob/main/lua/modules/plugins/cmp.lua
" https://github.com/mjlbach/defaults.nvim/blob/master/init.lua#L284
lua <<EOF

   local lsp_source = 'nvim_lsp'
   if vim.api.nvim_eval('g:use_nvim_lsp') == 0 then
      lsp_source = 'vim_lsp'
   end
   local cmp = require('cmp')
   cmp.setup({
       mapping = {
           ['<C-p>'] = cmp.mapping.select_prev_item(),
           ['<C-n>'] = cmp.mapping.select_next_item(),
           ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
           ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
           ['<C-d>'] = cmp.mapping.scroll_docs(-4),
           ['<C-f>'] = cmp.mapping.scroll_docs(4),
           ['<C-Space>'] = cmp.mapping.complete(),
           ['<C-e>'] = cmp.mapping.close(),
           --['<CR>'] = cmp.mapping.confirm({
           --    behavior = cmp.ConfirmBehavior.Replace,
           --    select = true,
           --}),
           ['<Tab>'] = function(fallback)
                           if cmp.visible() then
                               cmp.select_next_item()
                           else
                               fallback()
                           end
                       end,
           ['<S-Tab>'] = function(fallback)
                             if cmp.visible() then
                                 cmp.select_prev_item()
                             else
                                 fallback()
                             end
                         end,
       },

       sources = {
          { name = lsp_source },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'calc' },
          { name = 'orgmode' },
          { name = 'nvim-lua' },
       },

       formatting = {
           format = function(entry, vim_item)
               --vim_item.kind = string.format('%s %s', cmp_kinds[vim_item.kind], vim_item.kind)
               vim_item.menu = ({
                   nvim_lsp = '[Lsp]',
                   buffer = '[Buf]',
                   nvim_lua = '[Lua]',
                   path = '[Pth]',
                   calc = '[Cal]',
               })[entry.source.name]

               return vim_item
           end,
       },
   })
EOF

"autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
if g:use_ycm
   autocmd FileType cpp,objcpp,c,objc lua require('cmp').setup.buffer {enabled = false}
end

