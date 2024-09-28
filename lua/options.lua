vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set nowrap")
vim.cmd("set formatoptions-=t")
vim.g.mapleader = " "

--[[
vim.g.netrw_banner = 0
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
]]
--

local opt = vim.opt
opt.autowrite = true
opt.confirm = false
opt.number = true
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.undofile = true
opt.undolevels = 10000
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap
vim.opt_local.wrap = false
opt.timeoutlen = 300
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.inccommand = "split"

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- I want Neovim to name my tmux sessions to the current working directory. This autocommand does that.
vim.api.nvim_create_augroup("tmux", { clear = true })
if os.getenv("TMUX") then
	local function is_git_repo()
		return os.execute("git rev-parse --is-inside-work-tree > /dev/null 2>&1") == 0
	end
	-- Function to get the project root using git or fallback to current working directory
	local function get_project_root()
		-- Try run git rev-parse --show-toplevel to see if we are in a git repo
		if is_git_repo() then
			local git_dir = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
			return vim.fn.fnamemodify(git_dir, ":t")
		else
			return vim.fn.fnamemodify(vim.loop.cwd(), ":t")
		end
	end

	-- Rename the tmux window to the project name on certain events
	vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost", "BufNewFile", "FocusGained" }, {
		group = "tmux",
		callback = function()
			local project_name = get_project_root()
			os.execute("tmux rename-window " .. project_name)
		end,
	})

	-- Restore automatic renaming when Neovim is left or focus is lost
	vim.api.nvim_create_autocmd({ "VimLeave", "FocusLost" }, {
		group = "tmux",
		callback = function()
			os.execute("tmux set-window-option automatic-rename")
		end,
	})
end
