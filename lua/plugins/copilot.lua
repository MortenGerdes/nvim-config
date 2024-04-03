return {
	{
		"github/copilot.vim",
        enabled = false,
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		config = function()
            vim.cmd("let g:copilot_filetypes = {'go': v:true, 'lua': v:true, 'yaml': v:true}")
		end,
	},
}
