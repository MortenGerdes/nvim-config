local function get_cwd_name()
    local cwd = vim.fn.getcwd()
    local home = vim.fn.expand("$HOME")
    if cwd == home then
        return "~"
    end
    return vim.fn.fnamemodify(cwd, ":t")
end

return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "auto",
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
			},
			sections = {
				lualine_b = {
                    { get_cwd_name },
					{ "branch" },
					{ "diagnostics" },
					{ "filename", file_status = true, path = 1 },
				},
			},
		},
	},
}
