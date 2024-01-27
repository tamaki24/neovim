local lualine = require('lualine')
local config = {
  options = {
    -- 画面分割してもLualineは1つに
    globalstatus = true,
    -- セクション区切りの装飾
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    theme = 'nightfly'
  },
  sections = {
    lualine_a = {
      'mode',
    },
    lualine_b = {
      {
        'filename',
        newfile_status = true,
        path = 1,
        shorting_target = 24,
        symbols = { modified = '_󰷥', readonly = ' ', newfile = '󰄛' },
      },
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
      },
    },
    lualine_c = {
      {
        'b:gitsigns_head',
        icon = { '', color = { fg = "#F1502F" } },
      },
      {
        'diff',
        symbols = { added = ' ', modified = ' ', removed = ' ' },
        source = diff_source
      },

    },

    lualine_x = {
      {
        -- Lsp server name .
        function()
          local msg = 'No Active Lsp'
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
           local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = { ' ', color = { fg = '#008B8B' } },
      },
    },
    lualine_y = {
      { 'filetype' },
      'encoding'
    },

    lualine_z = {
      { 'fileformat', icons_enabled = true, separator = { left = '', right = '' } },
    },
  },
}

lualine.setup(config)
