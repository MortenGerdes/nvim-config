return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
        -- ft = { "c", "cpp", "css", "go", "html", "javascript", "json", "lua", "markdown", "python", "rust", "typescript", "vim", "yaml", },
        event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
		opts = {
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
				"go",
			},
		},
	},
}
