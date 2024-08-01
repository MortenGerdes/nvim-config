return {
	{
		"github/copilot.vim",
		keys = {
			{
				"<leader>he",
				function()
					vim.cmd("Copilot enable")
                    vim.cmd("Copilot status")
				end,
				desc = "Enable copilot",
			},
			{
				"<leader>ho",
				function()
					vim.cmd("Copilot disable")
                    vim.cmd("Copilot status")
				end,
				desc = "Disable copilot",
			},
		},
	},
}
