return {
	{
		"folke/which-key.nvim",
        event = "VeryLazy",
		opts = {
			plugins = { spelling = true },
			defaults = {
				{
					mode = { "n", "v" },
					{ "<leader><tab>",      group = "tabs" },
					{ "<leader>b",          group = "buffer" },
					{ "<leader>c",          group = "code" },
					{ "<leader>d",          group = "debug" },
					{ "<leader>f",          group = "file/find" },
					{ "<leader>g",          group = "git" },
					{ "<leader>gh",         group = "hunks" },
					{ "<leader>h",          group = "gitsigns" },
					{ "<leader>q",          group = "quit/session" },
					{ "<leader>s",          group = "search" },
					{ "<leader>t",          group = "test" },
					{ "<leader>u",          group = "ui" },
					{ "<leader>x",          group = "diagnostics/quickfix" },
					{ "[",                  group = "prev" },
					{ "]",                  group = "next" },
					{ "g",                  group = "goto" },
					{ "gs",                     group = "surround" },
				},
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
		end,
	},
}
