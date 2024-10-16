return {
	{
		"folke/noice.nvim",
		-- event = "UIEnter",
        event = "VeryLazy",
		opts = {
			-- add any options here
		},
        keys = {
            { "<leader>ud", "<cmd>NoiceDismiss<cr>", desc = "Dismiss notification" },
        },
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			{
				"rcarriga/nvim-notify",
				config = function()
					require("notify").setup({ -- Getting a weird error about the background colour not being set, hence this
						background_colour = "#000000",
					})
				end,
			},
		},
		config = function()
			-- We do this cause our overlord Folke is telling us to. No questions asked
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = true, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
			})
		end,
	},
}
