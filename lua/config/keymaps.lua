-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Close window
vim.api.nvim_set_keymap("n", "<leader>q", ":q<cr>", { noremap = true, silent = true })

--Zen mode
vim.api.nvim_set_keymap("n", "<leader>z", "<cmd>ZenMode<cr>", { noremap = true, silent = true })
