return {
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            label = {
                uppercase = false,
                before = true,
                after = false,
            },
            rainbow = {
                enabled = true,
                -- number between 1 and 9
                shade = 5,
            },
        },
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
        },
    },
}
