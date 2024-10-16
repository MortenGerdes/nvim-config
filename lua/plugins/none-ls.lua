local function redocly_lint()
    local null_ls = require("null-ls")
    local helpers = require("null-ls.helpers")

    return {
        method = null_ls.methods.DIAGNOSTICS,
        filetypes = { "yaml" },

        generator = null_ls.generator({
            ignore_stderr = true,
            command = "redocly",
            args = { "lint", "$FILENAME", "--format", "checkstyle" },
            format = "line",
            on_output = helpers.diagnostics.from_patterns({
                {
                    -- Examples:
                    -- <error line="129" column="5" severity="error" message="Operation object should contain `summary` field." source="operation-summary" />
                    -- <error line="20" column="5" severity="error" message="Operation object should contain `summary` field." source="operation-summary" />
                    -- <error line="2" column="1" severity="warning" message="Info object should contain `license` field." source="info-license" />
                    pattern = [[<error line="(%d+)" column="(%d+)" severity="(%w+)" message="(.+)" source="(.+)" />]],
                    groups = { "row", "col", "severity", "message", "source" },
                    overrides = { -- We want to list the errors as redocly as source, so we know where they come from
                        diagnostic = { source = "redocly" },
                    },
                },
            }),
        }),
    }
end

return {
    {
        "nvimtools/none-ls.nvim",
        ft = { "go", "gomod", "lua", "yaml", "proto" },
        config = function()
            local null_ls = require("null-ls")

            local custom_golangci = null_ls.builtins.diagnostics.golangci_lint
            custom_golangci._opts.args = { "run", "--exclude=copylocks", "--fix=false", "--out-format=json" } -- I don't care that I have copies locks. Go away

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.diagnostics.buf,
                    null_ls.builtins.formatting.buf,
                    custom_golangci,
                    redocly_lint,
                },
            })
        end,
    },
}
