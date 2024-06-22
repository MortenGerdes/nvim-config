local function open_menu()
	local harpoon = require("harpoon")
	harpoon.ui:toggle_quick_menu(harpoon:list())
end

return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		keys = {
            --stylua: ignore start
			{ "<C-S-h>", "<cmd>lua require('harpoon'):list():select(1)<cr>",    desc = "Go to Harpoon(1)" },
			{ "<C-S-j>", "<cmd>lua require('harpoon'):list():select(2)<cr>",    desc = "Go to Harpoon(2)" },
			{ "<C-S-k>", "<cmd>lua require('harpoon'):list():select(3)<cr>",    desc = "Go to Harpoon(3)" },
			{ "<C-S-l>", "<cmd>lua require('harpoon'):list():select(4)<cr>",    desc = "Go to Harpoon(4)" },
			{ "<leader>a", "<cmd>lua require('harpoon'):list():add()<cr>",      desc = "Add current buffer to Harpoon" },
			{ "<C-e>", open_menu,                                               desc = "Open Harpoon list" },
			--stylua: ignore end
		},
		requires = { { "nvim-lua/plenary.nvim" } },
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function(_, opts)
			require("harpoon"):setup(opts)
		end,
	},
}
