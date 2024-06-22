return {
	{
		"github/copilot.vim",
        enabled = true,
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		config = function()
            vim.cmd("let g:copilot_filetypes = {'go': v:false, 'lua': v:true, 'yaml': v:true}") -- Don't want it for go. I'm getting too stupid
		end,
	},
}
