return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
        { "<leader>1", "<cmd>Neotree toggle<CR>", desc = "Toggle Neotree" },
    },
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
                show_hidden_count = true,
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_by_name = {
                    -- '.git',
                    -- '.DS_Store',
                    -- 'thumbs.db',
                },
                never_show = {},
            },
        },
    },
}
