(fn setup []
  (set vim.g.nvim_tree_auto_close 1)
  (set vim.g.nvim_tree_tab_open 1)
  (set vim.g.nvim_tree_indent_markers 1)
  (vim.api.nvim_set_keymap "n" "<leader>f" "<cmd>NvimTreeToggle<CR>" {:silent true})
)

{:setup setup}
