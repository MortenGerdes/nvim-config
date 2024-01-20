return {
    {
        "kdheepak/lazygit.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("telescope").load_extension("lazygit")
            vim.g.lazygit_floating_window_use_plenary = 1
        end,
    },
}
