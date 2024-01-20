return {
	{
		"numToStr/FTerm.nvim",
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<c-_>", "<cmd>lua require('FTerm').toggle()<cr>")
		end,
		opts = {
			border = "double",
			dimensions = {
				height = 0.9,
				width = 0.9,
			},
		},
	},
}

