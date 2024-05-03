return {
	"echasnovski/mini.comment",
	event = "VeryLazy",
	config = function()
		require("mini.comment").setup()
	end,
	opts = {
		options = {
			custom_commentstring = function()
				return vim.bo.commentstring
			end,
		},
	},
}
