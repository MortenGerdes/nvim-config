return {
	{
		"ray-x/go.nvim",
		ft = { "go", "gomod" },
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		build = ':lua require("go.install").update_all()', -- if you need to install/update all binaries
		keys = {
			{ "<leader>cs", "<cmd>GoFillStruct<cr>", desc = "Go fill struct" },
			{ "<leader>ce", "<cmd>GoIfErr<cr>", desc = "Go if err" },
		},
		opts = {
			run_in_floaterm = true,
			floaterm = {
				posititon = "bottom",
				height = 0.4,
			},
		},
		config = function(_, opts)
			require("go").setup(opts)

			local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					require("go.format").goimport()
				end,
				group = format_sync_grp,
			})
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = { "go", "gomod" },
		config = function()
			require("dap-go").setup({
				delve = {
					build_flags = "-tags=integration",
				},
			})
            -- stylua: ignore
            vim.keymap.set("n", "<leader>td", "<cmd>lua require('dap-go').debug_test()<cr>",
                { desc = "Debug test", silent = true })
		end,
	},
	{
		"nvim-neotest/neotest",
		optional = true,
		dependencies = {
			"fredrikaverpil/neotest-golang",
		},
	       opts = {
			adapters = {
				["neotest-golang"] = {
					go_test_args = { "-v", "-race", "-count=1", "-tags=integration" },
				},
			},
	       },
	},
	-- {
	-- 	"nvim-neotest/neotest",
	-- 	dependencies = {
	-- 		"nvim-neotest/neotest-go",
	-- 	},
	-- 	opts = {
	-- 		adapters = {
	-- 			["neotest-go"] = {
	-- 				args = { "-tags=integration", "-count=1" },
	-- 				recursive_run = true,
	-- 			},
	-- 		},
	-- 	},
	-- },
}
