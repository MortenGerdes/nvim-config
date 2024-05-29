-- custom_goto_definition_spectral is a custom function to go to definition in Spectral
-- Since spectral didn't have it's own LSP we need to make our own. God bless Neovim
-- Need your own LSP? No worries.... Sometimes I miss Jetbrains
local custom_goto_definition_spectral = function()
	-- Get current line text
	local line = vim.api.nvim_get_current_line()
	if not line:find("$ref:") then
		vim.print("No definition found 1")
		return nil, { message = "No definition found", code = -32600 } -- -32600 is the JSON RPC error code for "Invalid request"
	end

	--Find content on line inside ""
	local content = line:match('"([^"]+)"')
	if not content then
        --Find content on line inside ''
        content = line:match("'([^']+)'")
        if not content then
            vim.print("No definition found 2")
            return nil, { message = "No definition found", code = -32600 }
        end
	end

	-- Split content by / and get the last part
	local parts = vim.split(content, "/")
	local last = parts[#parts]

	-- Find the <last>: in the file. Get line_nr and col_nr.
    local line_nr = vim.fn.search(last .. ":", "nbw")
	if line_nr == 0 then
		vim.print("No definition found 3")
		return nil, { message = "No definition found", code = -32600 }
	end

    -- Find the column number of the <last>: part using the line_nr
    local col_nr = vim.fn.stridx(vim.fn.getline(line_nr), last .. ":", 0)

    -- Set mark to jump back to. So we can ctrl-o back if we want
    vim.cmd('normal! m\'')

	-- Set cursor to line_nr and col_nr
	vim.api.nvim_win_set_cursor(0, { line_nr, col_nr })
end

-- On_Attach function so we can attach all our keybinds to the differnt LSPs
local on_attach = function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local opts = { buffer = bufnr }

    -- stylua: ignore start
    vim.keymap.set("n", "<space>cf", function() vim.lsp.buf.format({ async = false, }) end, vim.tbl_deep_extend("force", opts,                                 { desc = "Format" }))
    vim.keymap.set("n", "gd", function () require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, vim.tbl_deep_extend("force", opts,           { desc = "Go to definition" }))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_deep_extend("force", opts,                                                                             { desc = "Show hover" }))
    vim.keymap.set("n", "gI", function () require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, vim.tbl_deep_extend("force", opts,       { desc = "Go to implementation" }))
    vim.keymap.set("n", "gr", function() require('telescope.builtin').lsp_references({ reuse_win = true })end, vim.tbl_deep_extend("force", opts,              { desc = "Go to references" }))
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts) vim.keymap.set( "n", "gD", vim.lsp.buf.type_definition, vim.tbl_deep_extend("force", opts,  { desc = "Go to type definition" }))
    vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, vim.tbl_deep_extend("force", opts,                                                                    { desc = "Rename" }))
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, vim.tbl_deep_extend("force", opts,                                                      { desc = "Code action" }))
    vim.keymap.set({ "n", "v" }, "<space>cc", "<cmd>lua vim.lsp.codelens.run()<cr>", vim.tbl_deep_extend("force", opts,                                        { desc = "Run Codelens options(s)" }))
	-- stylua: ignore end
end

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
			ensure_installed = { "lua_ls", "gopls", "graphql", "spectral" },
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
                on_attach = on_attach,
				cmd = { "gopls", "-remote=auto" },
				flags = {
					debounce_text_changes = 150,
				},
				settings = {
					gopls = {
						buildFlags = { "-tags=integration" },
                        analyses = {
                            copylocks = false
                        },
					},
				},
			})
			lspconfig.lua_ls.setup({
				capabilities = cap,
                on_attach = on_attach,
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})
			lspconfig.graphql.setup({
				capabilities = cap,
                on_attach = on_attach,
				cmd = { "graphql-lsp", "server", "-m", "stream", "-c" },
			})

			lspconfig.spectral.setup({
				capabilities = cap,
                -- We don't have alot of help from Spectral since Spectral is only a linter
                -- So we need to make our own LSP behaviour if we want it.
                on_attach = function(_, bufnr)
                    vim.keymap.set("n", "gd", custom_goto_definition_spectral, { buffer = bufnr, desc = "Go to definition" })
                end,
			})

			lspconfig.bufls.setup({
				capabilities = cap,
                on_attach = on_attach,
			})
		end,
	},
}
