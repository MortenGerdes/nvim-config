--Cause I'm a JetBrains fanboy
if true then return {} end

return {
    {
        { "rktjmp/lush.nvim" },
    },
    {
        "briones-gabriel/darcula-solid.nvim",
        depedenencies = { "rktjmp/lush.nvim" },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "darcula-solid"
        },
    },
}
