return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("telescope").load_extension("fzf")
        end,
        keys = {
            { "<leader><Space>", "<cmd>Telescope find_files<cr>" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
        },
    },
    { 
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        config = function()
            require('telescope').setup({
                extensions = {
                    fzf = {
                      fuzzy = true,                    -- false will only do exact matching
                      override_generic_sorter = true,  -- override the generic sorter
                      override_file_sorter = true,     -- override the file sorter
                      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                                       -- the default case_mode is "smart_case"
                    }
                }
            })
        end
    },
}
