--if vim.g.use_nvim_lsp == 0 then
local use_nvim_lsp = vim.api.nvim_eval('g:use_nvim_lsp')
if use_nvim_lsp == 0 then
   return
end

local ccls_dir = vim.g.working_dir .. "/.sbtools/sbcpptags/ccls"
if vim.fn['isdirectory'](ccls_dir) == 1 then
   print("Enabling nvim-lsp")
else
   return
end

local lspconfig = require('lspconfig')
local completion = require('completion')
--local lsp_status = require('lsp-status')

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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- This will disable virtual text, like doing:
    virtual_text = false,
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    update_in_insert = false,
})

-- ℹ Ⓔ Ⓗ Ⓘ Ⓦ
vim.fn.sign_define("LspDiagnosticsSignError", {text="✘", texthl="LspError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text="⚠", texthl ="LspWarn"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text="ⅈ", texthl ="LspHint"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text="ℍ", texthl="LspHint"})

local on_attach = function(client, bufnr)
   -- print("Attaching")
   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
   completion.on_attach(client, bufnr)
   --lsp_status.on_attach(client, bufnr)

   -- Show diagnostic when cursor is on the line
   vim.api.nvim_command('autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()')

   local opts = { noremap=true, silent=true }
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rj', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rJ', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rf', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ra', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rv', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rg', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rs', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rp', '<cmd>lua peek_definition()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '[D', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', ']D', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'do', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
end

local ccls_cmd = '/mathworks/hub/share/sbtools/external-apps/ccls/ccls-20201123-2ad71f1/deb10-64/ccls'
local cache_dir = vim.g.working_dir .. '/.sbtools/sbcpptags/ccls'
local comp_dir = vim.g.working_dir .. '/.sbtools/sbcpptags'
local sync_master_path1 = '/local-ssd/jbarik/.Bmasklib.latest_pass.sbsyncmaster.inprogress/'
local sync_master_path2 = '/local-ssd/jbarik/.Bmasklib.latest_pass.sbsyncmaster/'
local master_sb_path = '/local-ssd/jbarik/Bmasklib.latest_pass/'
local target_path = vim.g.working_dir .. '/'

local on_ccls_attach = function(client, bufnr)
   vim.api.nvim_command('echo "Attaching ccls to buffer"')
   on_attach(clien, bufnr)
end

lspconfig.ccls.setup{
   cmd = { ccls_cmd,
           '--init={"cache":{"directory":"' .. cache_dir .. '"},' ..
           '"clang":{"pathMappings":["' .. sync_master_path1 .. '>' .. target_path .. '",' ..
           '"' .. sync_master_path2 .. '>' .. target_path .. '",' ..
           '"' .. master_sb_path .. '>' .. target_path .. '"]},' ..
           '"compilationDatabaseDirectory":"' .. comp_dir .. '",' ..
           '"diagnostics":{"onOpen":0,"onChange":-1,"onSave":0},' ..
           '"index":{"threads":12,"trackDependency":0}}'
      };
   allowlist = {"c", "cpp", "objc", "cc"};
   on_attach = on_ccls_attach
}

local configs = require'lspconfig/configs'
-- Check if it's already defined for when reloading this file.
if not lspconfig.matlab then
   configs.matlab = {
      default_config = {
         cmd = {'/home/jbarik/scripts/lsp_matlab'};
         root_dir = function(fname)
            return vim.g.working_dir;
         end;
         filetypes = {'m', 'matlab'};
      };
   }
end

local on_matlab_attach = function(client, bufnr)
   vim.api.nvim_command('echo "Attaching matlabls to buffer"')
   on_attach(clien, bufnr)
end

lspconfig.matlab.setup{
   allowlist = {'matlab'};
   on_attach = on_matlab_attach
}
--vim.lsp.set_log_level("debug")
return {
   peek_inside =  peek_definition
}
