(fn setup [] (let [opts {:silent true :noremap true}] 
    (vim.api.nvim_set_keymap "n" "<leader>tb" "<cmd>Telescope buffers<CR>" opts)
    (vim.api.nvim_set_keymap "n" "<leader>tf" "<cmd>Telescope find_files<CR>" opts)
))

(fn config [] (if (and
    (. packer_plugins :project_nvim)
    (. (. packer_plugins :project_nvim) :loaded))
  ((. (require :telescope) :load_extension) "projects")
))

{
  :setup setup
  :config config
}
