local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- アイコン表示
  'nvim-tree/nvim-web-devicons',
  -- 日本語ヘルプ
  'vim-jp/vimdoc-ja',
  -- 日本語入力
  -- {
  --   'vim-skk/skkeleton',
  --   config = function ()
  --     require('settings/skkeleton')
  --   end
  -- },
  -- 小道具
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('settings/mini')
    end
  },
  -- ターミナル
  'voldikss/vim-floaterm',
  -- コマンドボックス
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('settings/noice')
    end
  },
  -- Gitマーカー
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('settings/gitsigns')
    end
  },
  -- Gitを便利に使う
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
      "ibhagwan/fzf-lua",              -- optional
      'sindrets/diffview.nvim',
      { 'akinsho/git-conflict.nvim', version = "*", config = true }
    },
    config = function()
      require('settings/neogit')
    end
  },
  {
    'sindrets/diffview.nvim',
  },
  -- スクロールバー
  {
    'petertriho/nvim-scrollbar',
    dependencies = {
      'kevinhwang91/nvim-hlslens',
      'lewis6991/gitsigns.nvim',
    },
    config = function()
      require('settings/scrollbar')
    end
  },
  -- 閉じタグ自動入力
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup({})
    end
  },
  -- コメントアウト
  {
    'numToStr/Comment.nvim',
    config = function()
      require('settings/comment')
    end
  },
  -- バッファタブをかっこよく
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'lewis6991/gitsigns.nvim',
    },
    event = { 'BufNewFile', 'BufRead' },
    -- 設定ファイルは/settings/*にまとめた
    config = function()
      require('settings/barbar')
    end
  },
  {
    'shaunsingh/nord.nvim',
    config = function()
      --    require('settings/nord-theme')
    end
  },
  {
    "rmehri01/onenord.nvim",
    config = function()
      require('settings/onenord')
    end
  },
  -- 通知
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('settings/trouble')
    end
  },
  -- ステータスライン
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('settings/lualine')
    end
  },
  -- カーソルライン
  {
    'yamatsum/nvim-cursorline',
    config = function()
      require('settings/cursorline')
    end
  },
  -- ファジーファインダー
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
      'prochri/telescope-all-recent.nvim',
      'kkharji/sqlite.lua'
    },
    config = function()
      require('settings/telescope')
    end
  },
  -- ファイラ
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('settings/nvim-tree')
    end
  },
  -- 構文ハイライト
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('settings/treesitter')
    end
  },
  -- LSP
  {
    "williamboman/mason.nvim",
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'SmiteshP/nvim-navic',
      'SmiteshP/nvim-navbuddy',
      'MunifTanjim/nui.nvim'
    },
    config = function()
      require('settings/mason')
    end
  },
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    dependencies = {
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('settings/fidget')
    end
  },
  -- 補完
  {
    'onsails/lspkind-nvim',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-cmdline',
    },
    config = function()
      require('settings/lspkind')
    end
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
      'MunifTanjim/prettier.nvim',
    },
    -- config = function()
    --   require('settings/null-ls')
    -- end
  },
  -- 定義ジャンプ
  {
    'glepnir/lspsaga.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons'      -- optional
    },
    config = function()
      require('settings/lspsaga')
    end
  },
  -- カラーコードサンプル表示
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('settings/colorizer')
    end
  }
})
