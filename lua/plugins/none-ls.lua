return {
	{
		"nvimtools/none-ls.nvim",
		ft = {"go", "gomod", "lua"},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.golangci_lint,
				},
			})
		end,
	},
}
