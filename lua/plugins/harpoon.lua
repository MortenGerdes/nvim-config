return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
            local harpoon = require("harpoon")

            vim.keymap.set("n", "<leader>a", function()
                harpoon:list():append()
            end)
            vim.keymap.set("n", "<C-e>", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)

            vim.keymap.set("n", "<C-S-h>", function()
                harpoon:list():select(1)
            end)
            vim.keymap.set("n", "<C-S-j>", function()
                harpoon:list():select(2)
            end)
            vim.keymap.set("n", "<C-S-k>", function()
                harpoon:list():select(3)
            end)
            vim.keymap.set("n", "<C-S-l>", function()
                harpoon:list():select(4)
            end)
        end,
    },
}
