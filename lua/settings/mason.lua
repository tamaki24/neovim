require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    },
  },
})

local nvim_lsp = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
local navic = require('nvim-navic')
local navbuddy = require('nvim-navbuddy')

mason_lspconfig.setup_handlers({
  function(server_name)

    local node_root_dir = nvim_lsp.util.root_pattern("package.json")
    local is_node_repo = node_root_dir(vim.api.nvim_buf_get_name(0)) ~= nil

    local opts = {}

    if server_name == "tsserver" then
      if not is_node_repo then
        return
      end

      opts.root_dir = node_root_dir
    elseif server_name == "eslint" then
      if not is_node_repo then
        return
      end

      opts.root_dir = node_root_dir
    elseif server_name == "denols" then
      if is_node_repo then
        return
      end

      opts.root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc", "deps.ts", "import_map.json")
      opts.init_options = {
        lint = true,
        unstable = true,
        suggest = {
          imports = {
            hosts = {
              ["https://deno.land"] = true,
              ["https://cdn.nest.land"] = true,
              ["https://crux.land"] = true
            }
          }
        }
      }
    end

    -- キーマップ定義
    opts.on_attach = function(_, bufnr)
      local bufopts = { silent = true, buffer = bufnr }
      -- 定義ジャンプ
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      -- 実装ジャンプ
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'gd<Space>', ':split | lua vim.lsp.buf.definition()<CR>', bufopts)
      -- 整形
      vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)
    end

      nvim_lsp[server_name].setup(opts)
    end
})

navic.setup {
  lsp = {
    auto_attach = true,
  },
  highlight = true,
  depth_limit = 9,
  icons = {
    File = ' ',
    Module = ' ',
    Namespace = ' ',
    Package = ' ',
    Class = ' ',
    Method = ' ',
    Property = ' ',
    Field = ' ',
    Constructor = ' ',
    Enum = ' ',
    Interface = ' ',
    Function = ' ',
    Variable = ' ',
    Constant = ' ',
    String = ' ',
    Number = ' ',
    Boolean = ' ',
    Array = ' ',
    Object = ' ',
    Key = ' ',
    Null = ' ',
    EnumMember = ' ',
    Struct = ' ',
    Event = ' ',
    Operator = ' ',
    TypeParameter = ' ',
  },
}

navbuddy.setup({
  lsp = {
    auto_attach = true
  },
})
vim.keymap.set('n', 'nb', vim.cmd.Navbuddy)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = false,
  virtual_text = {
    format = function(diagnostic)
      return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
    end,
  },
})
