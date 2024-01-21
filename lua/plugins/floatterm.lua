return {
	{
		"numToStr/FTerm.nvim",
		enabled = false,
		event = "VeryLazy",
		config = function()
			vim.keymap.set({"n", "t"}, "<c-/>", "<cmd>lua require('FTerm').toggle()<cr>")
		end,
		opts = {
			border = "double",
			dimensions = {
				height = 0.9,
				width = 0.9,
			},
		},
	},
	{
		"voldikss/vim-floaterm",
        enabled = true,
		event = "VeryLazy",
		config = function()
            if vim.fn.has("mac") == 1 then
                vim.keymap.set({ "n", "t" }, "<c-/>", "<cmd>FloatermToggle<cr>")
            else
                vim.keymap.set({ "n", "t" }, "<c-_>", "<cmd>FloatermToggle<cr>")
            end
		end,
	},
}
