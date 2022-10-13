local opts = {noremap = true, silent = true}

local keymap = vim.keymap.set

-- Remap , as leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Disable highlights
keymap("n", "<leader><CR>", ":noh<CR>")
