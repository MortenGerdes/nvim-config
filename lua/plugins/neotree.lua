return {
	{
		"nvim-neo-tree/neo-tree.nvim",
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
}
