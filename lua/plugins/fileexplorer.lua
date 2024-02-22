return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = false,
		cmd = "Neotree",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		keys = {
			{
				"<leader>e",
				"<cmd>Neotree reveal_force_cwd<cr>",
				desc = "Toggle Neotree",
			},
		},
		opts = {
			--hijack_netrw_behaviour = "open_current",
			window = {
				mappings = {
					["<space>"] = "none",
				},
			},
			sources = { "filesystem", "buffers", "git_status", "document_symbols" },
			filesystem = {
				bind_to_cwd = false,
				use_libuv_file_watcher = true,
				filtered_items = {
					visible = true,
				},
				follow_current_file = { enabled = true },
			},
		},
	},
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
