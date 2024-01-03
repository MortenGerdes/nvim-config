-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd([[
  hi NotifyBackground guibg=#000000 ctermbg=1
]])

vim.cmd([[
  let g:gruvbox_transparent = 1
  let g:gruvbox_hls_cursor = 'both'
]])
