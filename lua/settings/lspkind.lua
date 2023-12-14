local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'
require('luasnip.loaders.from_vscode').lazy_load({
  paths = {
   './snippets',
    vim.fn.stdpath('data') .. '/lazy/friendly-snippets',
  }
})

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'luasnip' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      preset = 'codicons'
    })
  }
})

-- cmdline
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  cources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  source = cmp.config.sources({
      { name = 'path' }
    },
    {
      {
        name = 'cmdline',
        option = {
          ignore_cmds = { 'Man', '!' }
        }
      }
    })
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
