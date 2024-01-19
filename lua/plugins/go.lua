return {
    {
        "ray-x/go.nvim",
        ft = { "go", "gomod" },
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        event = { "CmdlineEnter" },
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
        keys = {
            { "<leader>cs", "<cmd>GoFillStruct<cr>", desc = "Go fill struct" },
            { "<leader>ce", "<cmd>GoIfErr<cr>",      desc = "Go if err" },
        },
        config = function()
            require("go").setup()

            local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.go",
                callback = function()
                    require("go.format").goimport()
                end,
                group = format_sync_grp,
            })
        end,
    },
    {
        "leoluz/nvim-dap-go",
        ft = { "go", "gomod" },
        config = function()
            require("dap-go").setup({
                delve = {
                    build_flags = "-tags=integration",
                },
            })
        end,
    },
}

