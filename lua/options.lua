vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.g.netrw_banner = 0
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1



-- Jump to windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Close window
vim.keymap.set("n", "<leader>q", ":q<cr>", { noremap = true, silent = true })

-- Save file
vim.keymap.set("n", "<leader>w", ":w<cr>", { noremap = true, silent = true })



local opt = vim.opt
opt.autowrite = true
opt.number = true
opt.relativenumber = true
opt.ignorecase = true
opt.termguicolors = true
opt.smartcase = true
opt.smartindent = true
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.undofile = true
opt.undolevels = 10000
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width
opt.wrap = false                   -- Disable line wrap
opt.timeoutlen = 300

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
