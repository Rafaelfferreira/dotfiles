vim.opt.number = true
vim.opt.relativenumber = true -- vim.opt allow us to access vim options as a table. the properties names can be found using the command :options
vim.opt.splitbelow = true -- makes new windows appear below the current window, not on top
vim.opt.splitright = true

vim.opt.tabstop = 4 -- Change the amount of spaces in a tab to 4
vim.opt.shiftwidth = 4 -- Change the amount of spaces on a shift

-- Keymapping
vim.g.mapleader = " " -- the "g" stands for global
vim.g.maplocalleader = ","

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- On normal mode, run vim.cmd.Ex whenever "<leader>pv" is pressed
