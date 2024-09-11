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
-- setup lazy plugins
---------------------------------------------------------------------------------------------------
require("lazy").setup({
	{
		"rose-pine/neovim",
		config = function()
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require 'nvim-treesitter.configs'.setup({
				auto_install = true, -- automatically install parsers when you open files of an extension you don't have a parser for	
				highlight = {
					enable = true
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						node_incremental = "v",
						node_decremental = "v",
					}
				},
				textobjects = {
					select = {
						enable = true,
						keymaps = {
							-- when you switch to visual mode, you can select a function outer level by pressing the keys ubsude []
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["as"] = { query = "@scope", desc = "select language scope" }
						},
					}
				}
			})
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects"
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.csharp_ls.setup{} -- C# LSP
		end,
	},
	{
		"nvim-telescope/telescope.nvim", tag = '0.1.8'
	},
	{
		"Olical/conjure"
	}
})

---------------------------------------------------------------------------------------------------
-- Configuring plugins
---------------------------------------------------------------------------------------------------

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
