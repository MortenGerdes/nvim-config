return {
    {
        "ellisonleao/gruvbox.nvim",
        enabled = true,
        priority = 1000,
        lazy = false,
        config = function()
            require("gruvbox").setup({
                overrides = {
                    FlashMatch = { bg = "#eba834", fg = "#282828" },
                    FlashLabel = { bg = "#bf4239", fg = "#282828" },
                },
                transparent_mode = true,
            })
        end,
    },
}
