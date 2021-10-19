require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'
  use 'rktjmp/hotpot.nvim'

  use {
    'vimwiki/vimwiki',
    setup = function ()
      vim.g.vimwiki_global_ext = 0
    end
  }

  use {
    'terrortylor/nvim-comment',
    keys = {'<leader>c'},
    config = function ()
      require('nvim_comment').setup {
        line_mapping = "<leader>cc",
        operator_mapping = "<leader>c"
      }
    end
  }

  use {
    "hrsh7th/nvim-cmp",
    -- event = 'InsertEnter',
    requires = {
      { "hrsh7th/vim-vsnip",    after = 'nvim-cmp' },
      { "hrsh7th/cmp-buffer",   after = 'nvim-cmp' },
      { "hrsh7th/cmp-path",     after = 'nvim-cmp' },
      { "hrsh7th/cmp-vsnip",    after = 'nvim-cmp' },
      { "hrsh7th/cmp-nvim-lsp" },
      { "rafamadriz/friendly-snippets" },
    },
    config = require'plugs.cmp'.config
  }

  use {
    "akinsho/toggleterm.nvim",
    keys = {
      {'n', [[<c-\>]]},
      {'n', [[<leader>g]]},
    },
    setup = require'plugs.toggleterm'.setup,
    config = require'plugs.toggleterm'.config,
  }

  use {'folke/tokyonight.nvim',
    -- event = 'UIEnter',
    setup = function ()
      vim.g.tokyonight_style = 'night'
      vim.opt.termguicolors = true -- beautiful truecolor
      vim.g.tokyonight_italic_functions = true
    end,
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end
  }

  use {
    "ahmedkhalf/project.nvim",
    requires = "telescope.nvim",
    config = function()
      require("project_nvim").setup {}
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    -- event = "BufRead", -- fine, as git cannot track files that don't exist
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }

  use {
    'nvim-lua/lsp-status.nvim',
    config = require'plugs.lsp-status'.config
  }

  use {
    'hoob3rt/lualine.nvim',
    -- event = 'UIEnter',
    requires = 'kyazdani42/nvim-web-devicons',
    after = { 'tokyonight.nvim', 'lsp-status.nvim' },
    config = require'plugs.lualine'.config
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    setup = require'plugs.nvim-tree'.setup
  }

  use {
    'neovim/nvim-lspconfig',
    after = {
      'lsp-status.nvim',
      'cmp-nvim-lsp',
    },
    config = require'plugs.lspconfig'.config,
  }

  use {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    requires = { {'nvim-lua/plenary.nvim'} },
    setup = require'plugs.telescope'.setup,
    config = require'plugs.telescope'.config,
  }

  use {'p00f/nvim-ts-rainbow', after = 'nvim-treesitter'}
  use {
    'nvim-treesitter/nvim-treesitter',
    -- event = 'BufEnter',
    run = ':TSUpdate',
    config = require'plugs.treesitter'.config
  }
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'shadow' })
    end
  },
}})
