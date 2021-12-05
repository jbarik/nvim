if vim.api.nvim_eval('g:use_nvim_lsp') == 0 then
   return
end

local enable_ccls = false;
local enable_clangd = false;
if vim.api.nvim_eval('g:local_sb') == 1 then
   print("Enabling nvim-lsp with ccls")
   enable_ccls = true;
elseif vim.api.nvim_eval('g:use_ycm') == 0 then
   print("Enabling nvim-lsp with clangd")
   enable_clangd = true;
end

-- Debugging lsp
-- Levels by name: "trace", "debug", "info", "warn", "error"
--                    0       1         2      3       4
-- see ~/.cache/nvim/lsp.log
-- vim.lsp.set_log_level('trace')
-- vim.lsp.set_log_level(1)

local function preview_location_callback(_, method, result)
  if result == nil or vim.tbl_isempty(result) then
    vim.lsp.log.info(method, 'No location found')
    return nil
  end
  if vim.tbl_islist(result) then
    vim.lsp.util.preview_location(result[1])
  else
    --print(vim.inspect(result))
    vim.lsp.util.preview_location(result)
  end
end

function peek_definition()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,
    update_in_insert = false,
})


vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
   vim.lsp.handlers.signature_help, {
      -- Use a sharp border with `FloatBorder` highlights
      border = "single"
})

-- ℹ Ⓔ Ⓗ Ⓘ Ⓦ
--vim.fn.sign_define("LspDiagnosticsSignError", {text="✘", texthl="LspError"})
--vim.fn.sign_define("LspDiagnosticsSignWarning", {text="⚠", texthl ="LspWarn"})
--vim.fn.sign_define("LspDiagnosticsSignInformation", {text="ⅈ", texthl ="LspHint"})
--vim.fn.sign_define("LspDiagnosticsSignHint", {text="ℍ", texthl="LspHint"})

local on_attach_fcn = function(client, bufnr)
   --print("Attaching lsp")
   -- Show diagnostic when cursor is on the line
   --vim.api.nvim_command('autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()')
   require "lsp_signature".on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "single"
      }
    }, bufnr)

   local opts = { noremap=true, silent=true }
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rj', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rJ', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rf', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ra', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rv', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rg', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rs', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rp', '<cmd>lua peek_definition()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '[D', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', ']D', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'do', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

--local on_ccls_attach = function(client, bufnr)
--   --vim.api.nvim_command('echo "Attaching ccls to buffer"')
--   on_attach_fcn(clien, bufnr)
--end

local get_ccls_root_dir = function()
   return vim.g.working_dir
end

--local get_clangd_root_dir = function()
--end

local cache_dir = vim.g.working_dir .. '/.sbtools/sbcpptags/ccls'
local comp_dir = vim.g.working_dir .. '/.sbtools/sbcpptags'
local sync_master_path1 = '/local-ssd/jbarik/.Bmasklib.latest_pass.sbsyncmaster.inprogress/'
local sync_master_path2 = '/local-ssd/jbarik/.Bmasklib.latest_pass.sbsyncmaster/'
local master_sb_path = '/local-ssd/jbarik/Bmasklib.latest_pass/'
local target_path = vim.g.working_dir .. '/'
local path_mapping1 = sync_master_path1 .. '>' .. target_path
local path_mapping2 = sync_master_path2 .. '>' .. target_path
local path_mapping3 = master_sb_path .. '>' .. target_path

capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

cpp_capabilities = capabilities;
cpp_capabilities.window.workDoneProgress = false;
cpp_capabilities.textDocument.completion.completionItem.snippetSupport = false;
cpp_capabilities.textDocument.completion.detailedLabel = false;
cpp_capabilities.textDocument.completion.placeholder = false;

if enable_ccls then
   lspconfig.ccls.setup{
      cmd = {'ccls'},
      root_dir = get_ccls_root_dir,
      init_options = {
         cache = {directory = cache_dir, retainInMemory = 1};
         compilationDatabaseDirectory = comp_dir;
         index = {
            threads = 12,
            trackDependency = 0
         },
         clang = {
            pathMappings = {path_mapping1, path_mapping2, path_mapping3}
         },
         codeLens = {
            localVariables = false;
         },
         diagnostics = {
            onOpen = 0,
            onChange = -1,
            onSave = 0,
         },
         foldingRangeProvider = false,
      },
      capabilities = cpp_capabilities,
      on_attach = on_attach_fcn,
   }

elseif enable_clangd then
   lspconfig.clangd.setup({
      cmd = { "clangd-13", "-header-insertion-decorators=0", "-limit-results=500"},
      filetypes = { "c", "cpp", "objc", "objcpp" },
      --root_dir = root_pattern("compile_commands.json", "compile_flags.txt", ".git") or dirname,
      single_file_support = true,
      --init_options = {},
      capabilities = cpp_capabilities,
      on_attach = on_attach_fcn,
   })
end

lspconfig.pyright.setup{
   on_attach = on_attach_fcn,
   capabilities = capabilities
}

local configs = require "lspconfig.configs"
if not configs.matlab then
  configs.matlab = {
    default_config = {
        cmd = {'/home/jbarik/scripts/lsp_matlab'};
        root_dir = function(fname)
           return vim.g.working_dir;
        end;
        filetypes = {'matlab'};
    },
  }
end

lspconfig.matlab.setup{
   allowlist = {'matlab'},
   on_attach = on_matlab_attach,
   capabilities = capabilities
}

return {
   peek_inside =  peek_definition
}

