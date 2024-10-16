local function show_macro_recording()
    local recording_register = vim.fn.reg_recording()
    if recording_register == "" then
        return ""
    else
        return "Recording @" .. recording_register
    end
end

return {
	{
		"nvim-lualine/lualine.nvim",
		-- event = "UIEnter",
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
					{ "branch" },
					{ "filename", file_status = true, path = 1 },
				},
                lualine_c = {
					{ "diagnostics" },
                    { "diff" },
                    { "gitsigns" },
                },
                lualine_x = {
                    { "filetype" },
                    { "fileformat" },
                    { show_macro_recording },
                },
			},
		},
	},
}
