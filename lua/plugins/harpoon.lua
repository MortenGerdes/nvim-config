return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		keys = {
			{ "<C-S-h>", "<cmd>lua require('harpoon'):list():select(1)<cr>", desc = "Go to Harpoon(1)" },
			{ "<C-S-j>", "<cmd>lua require('harpoon'):list():select(2)<cr>", desc = "Go to Harpoon(2)" },
			{ "<C-S-k>", "<cmd>lua require('harpoon'):list():select(3)<cr>", desc = "Go to Harpoon(3)" },
			{ "<C-S-l>", "<cmd>lua require('harpoon'):list():select(4)<cr>", desc = "Go to Harpoon(4)" },
			{ "<leader>a", "<cmd>lua require('harpoon'):list():append()<cr>", desc = "Add current buffer to Harpoon" },
			{
				"<C-e>",
				function()
					local conf = require("telescope.config").values
					local harpoon_files = require("harpoon"):list()
					local file_paths = {}
					for _, item in ipairs(harpoon_files.items) do
						table.insert(file_paths, item.value)
					end

					require("telescope.pickers")
						.new({}, {
							prompt_title = "Harpoon",
							finder = require("telescope.finders").new_table({
								results = file_paths,
							}),
							previewer = conf.file_previewer({}),
							sorter = conf.generic_sorter({}),
						})
						:find()
				end,
				desc = "Open Harpoon list",
			},
		},
		requires = { { "nvim-lua/plenary.nvim" } },
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function(_, opts)
			require("harpoon"):setup(opts)
		end,
	},
}
