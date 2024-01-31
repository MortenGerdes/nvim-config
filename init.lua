local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("keymaps")
require("lazy").setup("plugins", {
    install = {
        colorscheme = { "gruvbox" },
    },
    checker = {
        enabled = false, -- We'll manually handle this
        notify = false,
        frequency = 60 * 60 * 24 * 7, -- 1 week when enabled
    },
})
vim.cmd("colorscheme gruvbox")
