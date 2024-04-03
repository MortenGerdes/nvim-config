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
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        keys = {
            {"<leader>hd", "<cmd>Gitsigns diffthis<cr>", {desc = "Show difference"}}
        },
        opts = {
            current_line_blame = true,
        },
    },
}
