(fn setup [] (let [opts {:silent true :noremap true}] 
    (vim.api.nvim_set_keymap "n" "<leader>tb" "<cmd>Telescope buffers<CR>" opts)
    (vim.api.nvim_set_keymap "n" "<leader>tf" "<cmd>:lua require(\"telescope.builtin\").find_files(require'telescope.themes'.get_dropdown{ hidden=true })<CR>" opts)
))

(fn config []
    ((. (require :telescope) :load_extension) :fzf))

{ : setup : config }
