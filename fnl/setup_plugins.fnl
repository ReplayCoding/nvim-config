(fn setup_packages [use]
  (use :wbthomason/packer.nvim)
  (use :rktjmp/hotpot.nvim)

  (use {1 :vimwiki/vimwiki
        :setup (fn [] (set vim.g.vimwiki_global_ext 0))})

  (use {1 :terrortylor/nvim-comment
        :keys [:<leader>c]
        :config (fn []
                ((. (require :nvim_comment) :setup) {
                  :line_mapping :<leader>cc
                  :operator_mapping :<leader>c}))})

  (use {1 :hrsh7th/nvim-cmp
        :event :InsertEnter
        :requires [
                  {1 :hrsh7th/vim-vsnip :after :nvim-cmp}
                  {1 :hrsh7th/cmp-vsnip :after :nvim-cmp}
                  {1 :hrsh7th/cmp-buffer :after :nvim-cmp}
                  {1 :hrsh7th/cmp-path :after :nvim-cmp}
                  [:hrsh7th/cmp-nvim-lsp]
                  [:rafamadriz/friendly-snippets]]
        :config (. (require :plugs.cmp) :config)})

  (use {1 :akinsho/toggleterm.nvim
        :keys [
              [:n :<c-\>]
              [:n :<leader>g]]
        :setup (. (require :plugs.toggleterm) :setup)
        :config (. (require :plugs.toggleterm) :config)})

  (use {1 :folke/tokyonight.nvim
        :event :UIEnter
        :setup (fn []
                (set vim.g.tokyonight_style :night)
                (set vim.g.tokyonight_italic_functions true)
                (set vim.opt.termguicolors true))
        :config (fn []
                (vim.cmd "colorscheme tokyonight"))})

  (use {1 :ahmedkhalf/project.nvim
        :requires :telescope.nvim
        :config (fn []
                ((. (require :project_nvim) :setup)))})

  (use {1 :lewis6991/gitsigns.nvim
        :event :BufRead
        :requires [:nvim-lua/plenary.nvim]
        :config (fn []
                ((. (require :gitsigns) :setup)))})

  (use {1 :nvim-lua/lsp-status.nvim
        :config (. (require :plugs.lsp-status) :config)})

  (use {1 :hoob3rt/lualine.nvim
        :requires :kyazdani42/nvim-web-devicons
        :after [:tokyonight.nvim :lsp-status.nvim]
        :config (. (require :plugs.lualine) :config)})

  (use {1 :kyazdani42/nvim-tree.lua
        :cmd "NvimTreeToggle"
        :requires :kyazdani42/nvim-web-devicons
        :setup (. (require :plugs.nvim-tree) :setup)})
  (use {1 :neovim/nvim-lspconfig
        :after [:lsp-status.nvim :cmp-nvim-lsp]
        :config (. (require :plugs.lspconfig) :config)})

  (use {1 :nvim-telescope/telescope.nvim
        :cmd :Telescope
        :requires [:nvim-lua/plenary.nvim]
        :setup (. (require :plugs.telescope) :setup)
        :config (. (require :plugs.telescope) :config)})

  (use {1 :p00f/nvim-ts-rainbow :after :nvim-treesitter})
  (use {1 :nvim-treesitter/nvim-treesitter
        :run ":TSUpdate"
        :config (. (require :plugs.treesitter) :config)})
)

(let [packer (require :packer)]
  (packer.reset)
  (setup_packages packer.use))
