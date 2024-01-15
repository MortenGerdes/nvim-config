return
{
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
        "nvim-neotest/neotest-go",
    },
    opts = {
        adapters = {
            ["neotest-go"] = {
                args = { "-count=1", "-tags=integration" }
            },
        },
    },
}
