return {
	{
		"github/copilot.vim",
        enabled = true,
        ft = {"lua", "yaml", "yml", "json", "proto"},
		config = function()
            vim.cmd("let g:copilot_filetypes = {'go': v:false, 'lua': v:true, 'yaml': v:true}") -- Don't want it for go. I'm getting too stupid
		end,
	},
}
