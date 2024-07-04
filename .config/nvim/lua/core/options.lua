vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"

-- vim.o.mouse = "a"
-- vim.o.scrolloff = 999

-- CTRL+S
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })

-- Split windows
vim.keymap.set("n", "<leader>ws", "<Cmd>split<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>wv", "<Cmd>vsplit<CR>", { noremap = true, silent = false })
