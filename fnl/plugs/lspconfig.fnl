(fn config []
  (fn on_attach [client bufnr]
    ((. (require :lsp-status) :on_attach) client)

    (macro buf_set_normal_keymap [lhs rhs] `(vim.api.nvim_buf_set_keymap bufnr "n" ,lhs ,rhs {:noremap true :silent true}))
    (buf_set_normal_keymap "K" "<cmd>lua vim.lsp.buf.hover()<cr>")
    (buf_set_normal_keymap "<leader>ls" "<cmd>Telescope lsp_document_symbols<CR>")
    (buf_set_normal_keymap "<leader>lr" "<cmd>lua vim.lsp.buf.rename()<CR>")
    (buf_set_normal_keymap "<leader>lS" "<cmd>Telescope lsp_workspace_symbols<CR>")
    (buf_set_normal_keymap "<leader>lR" "<cmd>Telescope lsp_references<CR>")
    (buf_set_normal_keymap "<leader>li" "<cmd>Telescope lsp_implementations<CR>")
    (buf_set_normal_keymap "<leader>ld" "<cmd>Telescope lsp_definitions<CR>")
    (buf_set_normal_keymap "<leader>lt" "<cmd>Telescope lsp_document_diagnostics<CR>")
    (buf_set_normal_keymap "<leader>lT" "<cmd>Telescope lsp_workspace_diagnostics<CR>")
  )
  (let [
      nvim_lsp (require :lspconfig)
      servers [:gopls :clangd :rust_analyzer]
      capabilities ((. (require :cmp_nvim_lsp) :update_capabilities) (vim.lsp.protocol.make_client_capabilities))
    ]
    (each [_ lsp (ipairs servers)]
      ((. (. nvim_lsp lsp) :setup) {
        : on_attach
        : capabilities
        :flags {
          :debounce_text_changes 150
        }
      })
    )
  
    ;; I don't know if there is a better way to define this :(
    (var runtime_path (vim.split package.path ";"))
    (table.insert runtime_path "lua/?.lua")
    (table.insert runtime_path "lua/?/init.lua")
    (nvim_lsp.sumneko_lua.setup {
      : on_attach
      :cmd ["lua-language-server"]
      :settings { :Lua {
        :runtime {:version "LuaJIT" :path runtime_path}
        :diagnostics {:globals ["vim"]}
        :workspace {:library (vim.api.nvim_get_runtime_file "" true)}
        :telemetry {:enable false}
      }}
    })
  )
)

{
  : config
}
