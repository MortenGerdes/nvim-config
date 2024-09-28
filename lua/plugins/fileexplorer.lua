return {
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = true,
			watch_for_changes = true,
			view_options = {
				show_hidden = true,
				is_hidden_file = function(name, _) -- This function defines what is considered a "hidden" file
					return vim.startswith(name, ".")
				end,
			},
			win_options = {
				signcolumn = "yes",
			},
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split"},
				["<C-m>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split"},
				["<C-h>"] = false, --Don't steal my pane movements!
				["<C-l>"] = false,
				["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-u>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
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
