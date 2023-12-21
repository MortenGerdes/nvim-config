-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Close window
vim.api.nvim_set_keymap("n", "<leader>q", ":q<cr>", { noremap = true, silent = true })

-- Save file
vim.api.nvim_set_keymap("n", "<leader>w", ":w<cr>", { noremap = true, silent = true })

--Zen mode
vim.api.nvim_set_keymap("n", "<leader>z", "<cmd>ZenMode<cr>", { noremap = true, silent = true })

--Live grep
vim.api.nvim_set_keymap(
    "n",
    "<leader>fg",
    "<cmd>Telescope live_grep<cr>",
    { desc = "Opens Live_Grep in Telescope", noremap = true, silent = true }
)

--Run codelens options
vim.api.nvim_set_keymap(
    "n",
    "<leader>cc",
    "<cmd>lua vim.lsp.codelens.run()<CR>",
    { noremap = true, silent = true, desc = "Run Codelens option(s)" }
)
