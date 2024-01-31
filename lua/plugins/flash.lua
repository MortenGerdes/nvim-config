return {
	{
		"folke/flash.nvim",
		--event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		keys = {
            --stylua: ignore
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash", },
		},
		opts = {
			label = {
				uppercase = false,
				before = true,
				after = false,
			},
			rainbow = {
				enabled = true,
				-- number between 1 and 9
				shade = 5,
			},
		},
		config = function(_, opts)
			require("flash").setup(opts)
		end,
	},
}
