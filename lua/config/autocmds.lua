-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd([[
  hi NotifyBackground guibg=#000000 ctermbg=1
]])

vim.cmd([[
  let g:gruvbox_transparent = 1
  let g:gruvbox_hls_cursor = 'both'
]])

-- Function to format the current buffer with sql-formatter
_G.format_sql = function()
    -- Create a temporary JSON config file
    local temp_config = string.format("%s.json", vim.fn.tempname())
    local config_content = [[{ "language": "postgresql", "tabWidth": 4, "keywordCase": "upper" }]]

    -- Write json to the temp config file without a newline
    vim.fn.writefile({ config_content }, temp_config, 'b')

    -- Save the current cursor position
    local save_cursor = vim.fn.getpos('.')

    -- Run sql-formatter with the -c flag and the path to the temp config file
    local cmd = string.format('sql-formatter --config %s', temp_config)
    local exit_code = vim.fn.system(cmd)

    -- Check if sql-formatter returned exit code 0
    vim.cmd('%!sql-formatter --config ' .. temp_config)

    -- Restore the cursor position
    vim.fn.setpos('.', save_cursor)

    -- Delete the temporary config file
    --vim.fn.delete(temp_config)
end

-- Autocommand to format SQL files on save
vim.api.nvim_exec([[
augroup FormatSQL
    autocmd!
    autocmd BufWritePre *.sql lua format_sql()
augroup END
]], false)
