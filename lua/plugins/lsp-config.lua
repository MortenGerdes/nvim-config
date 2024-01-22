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
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = {
			ensure_installed = { "lua_ls", "gopls" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		config = function()
			require("neodev").setup()
			local cap = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.gopls.setup({
				capabilities = cap,
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
			lspconfig.lua_ls.setup({
				capabilities = cap,
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }

                    -- stylua: ignore start
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_deep_extend("force", opts,                                                                       { desc = "Go to declaration" }))
                    vim.keymap.set( "n", "gd", function () require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, vim.tbl_deep_extend("force", opts,           { desc = "Go to definition" }))
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set( "n", "gI", function () require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, vim.tbl_deep_extend("force", opts,       { desc = "Go to implementation" }))
                    vim.keymap.set( "n", "gr", function() require('telescope.builtin').lsp_references({ reuse_win = true })end, vim.tbl_deep_extend("force", opts,              { desc = "Go to references" }))
                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts) vim.keymap.set( "n", "gD", vim.lsp.buf.type_definition, vim.tbl_deep_extend("force", opts,   { desc = "Go to type definition" }))
                    vim.keymap.set( "n", "<space>cr", vim.lsp.buf.rename, vim.tbl_deep_extend("force", opts,                                                                    { desc = "Rename" }))
                    vim.keymap.set( { "n", "v" }, "<space>ca", vim.lsp.buf.code_action, vim.tbl_deep_extend("force", opts,                                                      { desc = "Code action" }))
                    vim.keymap.set( { "n", "v" }, "<space>cc", "<cmd>lua vim.lsp.codelens.run()<cr>", vim.tbl_deep_extend("force", opts,                                        { desc = "Run Codelens options(s)" }))
                    vim.keymap.set("n", "<space>cf", function()
                        vim.lsp.buf.format({
                            async = false,
                            filter = function(client)
                                --If language is lua then use null-ls
                                return client.name == "null-ls" and vim.bo.filetype == "lua"
                            end,
                            })
                    end,
                    vim.tbl_deep_extend("force", opts,                                                                                                                          { desc = "Format" }))
					-- stylua: ignore end
				end,
			})
		end,
	},
}
