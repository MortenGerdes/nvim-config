return {
	{
		"kdheepak/lazygit.nvim",
		cmd = "LazyGit",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"mgierada/lazydocker.nvim",
        cmd = "Lazydocker",
		dependencies = { "akinsho/toggleterm.nvim" },
		config = function()
			require("lazydocker").setup({})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
        ft = {"go", "lua", "yaml", "yml", "json", "proto"},
		keys = {
			{ "<leader>hd", "<cmd>Gitsigns diffthis<cr>", { desc = "Show difference" } },
		},
		opts = {
			current_line_blame = true,
		},
	},
}
