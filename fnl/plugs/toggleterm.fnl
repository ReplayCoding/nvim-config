(fn config []
  ((. (require :toggleterm) :setup) {
    :size 15
    :open_mapping "<c-\\>"
    :hide_numbers true
    :shade_filetypes {}
    :shade_terminals true
    :shading_factor 3
    :start_in_insert true
    :insert_mappings true
    :persist_size true
    :direction "horizontal"
    :close_on_exit true
    :shell vim.o.shell
    :float_opts {
      :winblend 3
      :border :single
    }
  })
  (let [Terminal (. (require :toggleterm.terminal) :Terminal)]
    (local lazygit_terminal (Terminal:new {
      :cmd :lazygit
      :direction :float
      :count 2 ;; Otherwise the bottom terminal is #2
    }))
    (fn _G._lazygit_toggle []
      (lazygit_terminal:toggle)
    )
    (vim.api.nvim_set_keymap "n" "<leader>g" "<cmd>lua _G._lazygit_toggle()<CR>" {:noremap true})
  )
)

(fn setup []
  (set vim.opt.hidden true)
)

{: config : setup}
