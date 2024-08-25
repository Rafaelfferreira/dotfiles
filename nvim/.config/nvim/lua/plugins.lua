---------------------------------------------------------------------------------------------------
-- Downloading lazyVim and adding it to the runtime path
---------------------------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then -- if the lazypath directory does not exist run this code
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath
	})
	if vim.v.shell_error ~= 0 then -- error handling if cloning the repo goes wrong
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim\n", "ErrorMsg" },
			{ out "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath) -- add lazy path to the runtime path


---------------------------------------------------------------------------------------------------
-- Setup lazy plugins
---------------------------------------------------------------------------------------------------
require("lazy").setup({
	{
		"rose-pine/neovim",
		config = function()
		end
	}
})

-- Configuring rose-pine
require("rose-pine").setup({
	styles = {
		transparency = true
	},
	highlight_groups = {
		Comment = { fg = "iris" },
		StatusLine = { fg = "love", bg = "love", blend = 10 },
		StatusLineNC = { fg = "subtle", bg = "surface" },
	},
})

vim.cmd.colorscheme("rose-pine-moon")
