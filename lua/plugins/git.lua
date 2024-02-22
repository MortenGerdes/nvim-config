return {
	{
		"kdheepak/lazygit.nvim",
        cmd = "LazyGit",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
    {
        "lewis6991/gitsigns.nvim",
		event = { "BufReadPost !*oil", "BufNewFile", "BufWritePre" },
        opts = {
            current_line_blame = true,
        },
    },
}
