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

require("lspconfig").golangci_lint_ls.setup {
    filetypes = { 'go' }
}

require("lspconfig").sqlls.setup({
    cmd = { "sql-language-server", "up", "--method", "stdio" },
    filetypes = { "sql" },
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
})

require("lspconfig").graphql.setup({
    cmd = { "graphql-lsp", "server", "-m", "stream" },
    filetypes = { "graphql" },
})

--[[
require('lint').linters_by_ft = {
    sql = { 'sqlfluff' }
}
--]]
require("telescope").load_extension("fzf")
