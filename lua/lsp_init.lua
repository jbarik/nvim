if vim.g.use_nvim_lsp == 0 then
   return
end

local ccls_dir = vim.g.working_dir .. "/.sbtools/sbcpptags/ccls"
if vim.fn['isdirectory'](ccls_dir) == 1 then
   print("lua - Enabling nvim-lsp with ccls")
else
   return
end

local ccls_cmd = '/mathworks/hub/share/sbtools/external-apps/ccls/ccls-20200620-8cf8a3c/deb10-64/ccls'
local cache_dir = vim.g.working_dir .. '/.sbtools/sbcpptags/ccls'
local comp_dir = vim.g.working_dir .. '/.sbtools/sbcpptags'
local sync_master_path1 = '/local-ssd/jbarik/.Bmasklib.latest_pass.sbsyncmaster.inprogress/'
local sync_master_path2 = '/local-ssd/jbarik/.Bmasklib.latest_pass.sbsyncmaster/'
local master_sb_path = '/local-ssd/jbarik/Bmasklib.latest_pass/'
local target_path = vim.g.working_dir .. '/'
local nvim_lsp = require 'nvim_lsp'

nvim_lsp.ccls.setup{
   cmd = { ccls_cmd,
           '--init={"cache":{"directory":"' .. cache_dir .. '"},' ..
            '"clang":{"pathMappings":["' .. sync_master_path1 .. '>' .. target_path .. '",' ..
             '"' .. sync_master_path2 .. '>' .. target_path .. '",' ..
             '"' .. master_sb_path .. '>' .. target_path .. '"]},' ..
            '"compilationDatabaseDirectory":"' .. comp_dir .. '",' ..
            '"index":{"threads":12,"trackDependency":0}}'
           };
   whitelist = {"c", "cpp", "objc", "cc"};
}

local function preview_location_callback(_, method, result)
  if result == nil or vim.tbl_isempty(result) then
    vim.lsp.log.info(method, 'No location found')
    return nil
  end
  if vim.tbl_islist(result) then
    vim.lsp.util.preview_location(result[1])
  else
    vim.lsp.util.preview_location(result)
  end
end

function peek_definition()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
end

-- Create short cuts
vim.api.nvim_set_keymap('n', '<leader>rJ',
                        '<cmd>lua vim.lsp.buf.declaration()<CR>',
                        { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rj',
                        '<cmd>lua vim.lsp.buf.definition()<CR>',
                        { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rf',
                        '<cmd>lua vim.lsp.buf.references()<CR>',
                        { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ri',
                        '<cmd>lua vim.lsp.buf.hover()<CR>',
                        { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rs',
                        '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>',
                        { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rv',
                        '<cmd>lua vim.lsp.buf.implementation()<CR>',
                        { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rp',
                        '<cmd>lua require("lsp_init").peek_inside()<CR>',
                        { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rd',
                        '<cmd>lua vim.lsp.buf.hover()<CR>',
                        { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rg',
                        '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                        { noremap = true, silent = true })

return {
   peek_inside =  peek_definition
}

-- nvim_lsp.ccls.setup{
--    cmd = { "ccls" };
--    init_options = {
--       cache = { directory = cache_dir },
--       compilationDatabaseDirectory = comp_dir,
--       clang = {
--          pathMappings = {
--             sync_master_path1 .. '>' .. target_path,
--             sync_master_path2 .. '>' .. target_path,
--             master_sb_path .. '>' ..target_path
--          },
--       },
--       index = {threads = 12, trackDependency = 0}
--    };
--    whitelist = {"c", "cpp", "objc", "cc"};
-- }


-- completion = { detailedLabel = false, caseSensitivity = 1 },
-- diagnostics = { onChange = -1 }
