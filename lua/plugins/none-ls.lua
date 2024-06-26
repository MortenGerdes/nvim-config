return {
	{
		"nvimtools/none-ls.nvim",
		ft = { "go", "gomod", "lua", "yaml", "proto" },
		config = function()
			local null_ls = require("null-ls")

			local custom_golangci = null_ls.builtins.diagnostics.golangci_lint
			custom_golangci._opts.args = { "run", "--exclude=copylocks", "--fix=false", "--out-format=json" } -- I don't care that I have copies locks. Go away

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.buf,
                    null_ls.builtins.formatting.buf,
					custom_golangci,
				},
			})
		end,
	},
}
