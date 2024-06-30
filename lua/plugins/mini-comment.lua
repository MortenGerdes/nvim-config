return {
	"echasnovski/mini.comment",
    ft = { "lua", "go", "yaml", "json", "graphql" },
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
