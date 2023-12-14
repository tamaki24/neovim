vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local keymap = vim.keymap
local nvim_tree = require('nvim-tree')

nvim_tree.setup({
  update_cwd = true,
  hijack_cursor = true,
  git = {
    ignore = false,
  },
  actions = {
    open_file = {
      resize_window = true,
      quit_on_open = true
    },
  },
  view = {
    width = '20%',
    signcolumn = 'no',
    side = 'left'
  },
  renderer = {
    highlight_git = true,
    root_folder_modifier = ':t',
    icons = {
      glyphs = {
        default = '',
        symlink = '',
        bookmark = '◉',
        git = {
          unstaged = '',
          staged = '',
          unmerged = '󰊢',
          renamed = '',
          deleted = '',
          untracked = '',
          ignored = '󱥸',
        },
        folder = {
          default = '',
          open = '',
          symlink = '',
        },
      },
      show = {
        git = false,
        file = true,
        folder = true,
        folder_arrow = false,
      },
    },
    indent_markers = {
      enable = true,
    },
  },

  on_attach = require('settings.nvim-tree-actions').on_attach,
})

keymap.set('n', '<Space><Space>', '<Cmd>NvimTreeToggle<CR>', { silent = true })
keymap.set('n', '<Space>F', '<Cmd>NvimTreeFindFile<CR>z.', { silent = true })
