return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        event = { "VeryLazy" },
        config = function(_, opts)
           require("nvim-treesitter.configs").setup(opts) 
        end,
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "bash",
                "c",
                "diff",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "jsonc",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "query",
                "regex",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
                "go",
              },
        },
    }
}
