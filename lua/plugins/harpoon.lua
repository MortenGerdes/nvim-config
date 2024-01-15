-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } },
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            local harpoon = require("harpoon")

            vim.keymap.set("n", "<leader>a", function()
                harpoon:list():append()
            end, { desc = "Add current file to harpoon" })
            vim.keymap.set("n", "<C-e>", function()
                toggle_telescope(harpoon:list())
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
