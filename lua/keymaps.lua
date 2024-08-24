-- Jump to windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Navigate vim panes better
-- vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
-- vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
-- vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
-- vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- Close window
vim.keymap.set({"n", "v"}, "<leader>q", "<cmd>q<cr>", { noremap = true, silent = true, desc = "Close window" })

-- Save file
vim.keymap.set("n", "<leader>w", "<cmd>wall<cr>", { noremap = true, silent = true, desc = "Save all files" })

-- Lazy git
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { noremap = true, silent = true, desc = "LazyGit" })

-- Lazy docker
vim.keymap.set("n", "<leader>gd", "<cmd>Lazydocker<cr>", { noremap = true, silent = true, desc = "LazyDocker" })

-- ZenMode
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { noremap = true, silent = true, desc = "ZenMode" })


-- Diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end

-- Diagnostic
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

vim.keymap.set("n", "<leader>ci", function() -- Not working. Maybe it will work later?
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
end, {desc = "Toggle inlay hints"})
