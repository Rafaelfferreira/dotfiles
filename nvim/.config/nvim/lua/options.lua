vim.opt.number = true
vim.opt.relativenumber = true -- vim.opt allow us to access vim options as a table. the properties names can be found using the command :options
vim.opt.splitbelow = true -- makes new windows appear below the current window, not on top
vim.opt.splitright = true

vim.opt.wrap = false
vim.opt.tabstop = 4 -- Change the amount of spaces in a tab to 4
vim.opt.shiftwidth = 4 -- Change the amount of spaces on a shift

vim.opt.virtualedit = "block" -- Can position the selector in spaces with no characters 
vim.opt.inccommand = "split" -- Shows a preview of changes made with the :%s search and replace; the command is used like :%s/old/new
vim.opt.scrolloff = 999 -- makes the cursor stays in the middle of the screen during long scrolls

vim.opt.termguicolors = true -- Is this worth using on wezterm?
vim.opt.timeoutlen = 500 -- The time in miliseconds to input keys for a specific command/keymap

-- Keymapping
vim.g.mapleader = " " -- the "g" stands for global
vim.g.maplocalleader = ","

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- On normal mode, run vim.cmd.Ex whenever "<leader>pv" is pressed
