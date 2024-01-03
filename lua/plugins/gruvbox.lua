return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        opts = {},
        config = function()
            vim.o.background = "dark"
            require("gruvbox").setup({
                overrides = {
                    FlashMatch = { bg = "#eba834", fg = "#282828" },
                    FlashLabel = { bg = "#bf4239", fg = "#282828" },
                },
                transparent_mode = true,
            })
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "gruvbox",
        },
    },
}
