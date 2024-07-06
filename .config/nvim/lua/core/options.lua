vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.pumheight = 4
vim.o.ignorecase = true

-- vim.o.mouse = "a"
-- vim.o.scrolloff = 999

-- CTRL+S
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })

-- Split windows
vim.keymap.set("n", "<leader>ws", "<Cmd>split<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>wv", "<Cmd>vsplit<CR>", { noremap = true, silent = false })

-- Disable arrow keys
vim.keymap.set("n", "<Up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Right>", "<Nop>", { noremap = true, silent = true })

-- Optionally, disable them in insert and visual mode as well
vim.keymap.set("i", "<Up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<Right>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "<Up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "<Right>", "<Nop>", { noremap = true, silent = true })
