-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("lspconfig").gopls.setup({
  cmd = { "gopls", "-remote=auto" },
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    gopls = {
      buildFlags = { "-tags=integration" },
    },
  },
})
