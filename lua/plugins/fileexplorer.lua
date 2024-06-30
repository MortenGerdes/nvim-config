return {
	{
		"stevearc/oil.nvim",
		opts = {
            default_file_explorer = true,
			view_options = {
				show_hidden = true,
				is_hidden_file = function(name, _) -- This function defines what is considered a "hidden" file
					return vim.startswith(name, ".")
				end,
			},
			win_options = {
				signcolumn = "yes",
			},
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function(_, opts)
			require("oil").setup(opts)
			vim.keymap.set("n", "-", "<cmd>Oil<cr>", { noremap = true, silent = true })
		end,
	},
}
