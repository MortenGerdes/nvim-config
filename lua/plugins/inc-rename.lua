return {
	"smjonas/inc-rename.nvim",
    event = { "BufReadPost !*oil", "BufNewFile", "BufWritePre" },
	config = function()
		vim.keymap.set("n", "<leader>cr", ":IncRename ")
		require("inc_rename").setup({
			input_buffer_type = nil,
		})
	end,
}
