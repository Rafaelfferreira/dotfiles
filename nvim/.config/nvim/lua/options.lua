vim.opt.number = true
vim.opt.relativenumber = true

-- Keymapping
vim.g.mapleader = " " -- the "g" stands for global
vim.g.maplocalleader = ","

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- On normal mode, run vim.cmd.Ex whenever "<leader>pv" is pressed
