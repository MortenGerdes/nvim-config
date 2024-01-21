function _G.update_statusline()
 local bufnr = vim.api.nvim_get_current_buf()
 local buftype = vim.api.nvim_buf_get_option(bufnr, 'buftype')

 if buftype == 'nofile' then
    require('lualine').set_statusline('Terminal')
 else
    require('lualine').reset_statusline()
 end
end

return {
	{
		"numToStr/FTerm.nvim",
		enabled = false,
		event = "VeryLazy",
		config = function()
			vim.keymap.set({"n", "t"}, "<c-/>", "<cmd>lua require('FTerm').toggle()<cr>")
		end,
		opts = {
			border = "double",
			dimensions = {
				height = 0.9,
				width = 0.9,
			},
		},
	},
	{
		"voldikss/vim-floaterm",
        enabled = true,
		event = "VeryLazy",
		config = function()
			vim.keymap.set({ "n", "t" }, "<c-/>", "<cmd>FloatermToggle<cr>")
		end,
	},
}
