return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        opts = {
            ensure_installed = { "lua_ls", "gopls" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        config = function()
            local cap = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.gopls.setup({
                capabilities = cap,
            })
            lspconfig.lua_ls.setup({
                capabilities = cap,
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_deep_extend("force", opts, {desc = "Go to declaration"}))
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_deep_extend("force", opts, {desc = "Go to definition"}))
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, vim.tbl_deep_extend("force", opts, {desc = "Go to implementation"}))
                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, vim.tbl_deep_extend("force", opts, {desc = "Go to type definition"}))
                    vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, vim.tbl_deep_extend("force", opts, {desc = "Rename"}))
                    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, vim.tbl_deep_extend("force", opts, {desc = "Code account"}))
                    vim.keymap.set({ "n", "v" }, "<space>cc", vim.lsp.buf.codelens.run(), vim.tbl_deep_extend("force", opts, {desc = "Run Codelens options(s)"}))
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_deep_extend("force", opts, {desc = "Go to references"}))
                    vim.keymap.set("n", "<space>cf", function()
                        vim.lsp.buf.format({ async = true })
                    end, vim.tbl_deep_extend("force", opts, {desc = "Format"}))
                end,
            })
        end,
    },
}
