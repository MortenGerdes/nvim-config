return {
	"nvimdev/dashboard-nvim",
    enabled = function()
        local amountOfArgs = #vim.v.argv
        return amountOfArgs == 2 -- For some reason, vim starts with 2 "hidden" args by default. 3 if I do "nvim ."
    end,
	event = "VimEnter",
	opts = function()
        math.randomseed(os.time()) -- A hack for Windows WLS. The seed is static otherwise
		local opts = {
			theme = "doom",
			hide = {
				-- this is taken care of by lualine
				-- enabling this messes up the actual laststatus setting after loading a file
				statusline = false,
			},
			config = {
				header = require("ascii").get_random("text", "neovim"),
                -- stylua: ignore start
                center = {
                    { action = "Telescope git_files",                                                   desc = " Git files",    icon = "󰊢 ", key = "f" },
                    { action = "Telescope find_files",                                                  desc = " Find files",   icon = " ", key = "d" },
                    { action = "Telescope live_grep",                                                   desc = " Find text",    icon = " ", key = "g" },
                    { action = "Telescope oldfiles",                                                    desc = " Recent files", icon = " ", key = "r" },
                    { action = "ene | startinsert",                                                     desc = " New file",     icon = " ", key = "n" },
                    { action = "cd $HOME/.config/nvim | Telescope find_files cwd=$HOME/.config/nvim",   desc = " Config",       icon = " ", key = "c" },
                    { action = "Lazy",                                                                  desc = " Lazy",         icon = "󰒲 ", key = "l" },
                    { action = "qa",                                                                    desc = " Quit",         icon = " ", key = "q" },
                },
				-- stylua: ignore end
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return { "⚡ Morten's Neovim config loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
				end,
			},
		}

		for _, button in ipairs(opts.config.center) do
			button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
			button.key_format = "  %s"
		end
		return opts
	end,
}
