vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shortmess = 'filnxtToOFI'
vim.opt.signcolumn = 'yes'

vim.g.mapleader = '\\'


local hotpot_path = vim.fn.stdpath('data')..'/site/pack/packer/start/hotpot.nvim'
if vim.fn.empty(vim.fn.glob(hotpot_path)) > 0 then
  print("Could not find hotpot.nvim, cloning new copy to", hotpot_path)
  vim.fn.system({'git', 'clone',
                 'https://github.com/rktjmp/hotpot.nvim', hotpot_path})
end

require('hotpot')

require('disable_builtins')
require('setup_packer')
