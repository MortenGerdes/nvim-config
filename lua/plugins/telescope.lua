local function git_files_or_find_files()
	local opts = {
		previewer = false,
	}
	local ok = pcall(require("telescope.builtin").git_files, opts)
	if not ok then
		require("telescope.builtin").find_files(opts)
	end
end

return {
	{
		"nvim-telescope/telescope.nvim",
		-- event = "UIEnter", -- We have to load Telescope due to the dashboard using it. Would love a way to lazy load it
        event = "VeryLazy",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<esc>"] = actions.close, -- We want to close telescope on the first click of escape
						},
					},
				},
			})
			require("telescope").load_extension("fzf")
		end,
        -- stylua: ignore
        keys = {
            { "<leader><Space>", git_files_or_find_files,                        { desc = "Smart find files" } },
            { "<leader>ff",      "<cmd>Telescope find_files<cr>",                { desc = "Find files" } },
            { "<leader>fg",      "<cmd>Telescope live_grep<cr>",                 { desc = "Live grep" } },
            { "<leader>fb",      "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Fuzzy find in buffer" } },
        },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		lazy = true,
		build = "make",
		config = function()
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		ft = { "go", "lua", "yaml", "yml", "json", "proto" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),

						-- pseudo code / specification for writing custom displays, like the one
						-- for "codeactions"
						-- specific_opts = {
						--   [kind] = {
						--     make_indexed = function(items) -> indexed_items, width,
						--     make_displayer = function(widths) -> displayer
						--     make_display = function(displayer) -> function(e)
						--     make_ordinal = function(e) -> string
						--   },
						--   -- for example to disable the custom builtin "codeactions" display
						--      do the following
						--   codeactions = false,
						-- }
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}
