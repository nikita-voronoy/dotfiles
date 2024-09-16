-- Setup leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set the numbers and emergency options
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.opt.pumheight = 8

-- Optional options, some options related to LSP servers
vim.o.pumwidth = 40
vim.o.ignorecase = true
vim.o.showmatch = true
vim.o.scrolloff = 10
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.fileformat = 'unix'

--#region Rust
-- Rust: rustaceanvim plugin setup
vim.g.rustaceanvim = {
    server = {
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    allFeatures = true,
                    command = "clippy",
                    extraArgs = {
                        "--",
                        "--no-deps",
                        "-Dclippy::all",
                    },
                },
            },
        },
    },
}
--#endregion


vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*",
    command = "set fileformat=unix"
})

-- Move line like IDE Shift+<KJ>
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- CTRL+S
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
-- Split windows
vim.keymap.set("n", "<leader>w", "", { noremap = true, silent = false, desc = "Window manager" })
vim.keymap.set("n", "<leader>ws", "<Cmd>split<CR>", { noremap = true, silent = false, desc = "Split by -" })
vim.keymap.set("n", "<leader>wv", "<Cmd>vsplit<CR>", { noremap = true, silent = false, desc = "Split by |" })

-- Disable arrow keys (including with Shift) I hate this behavior.
local modes = { "n", "i", "v" }
local arrows = { "Up", "Down", "Left", "Right" }

for _, mode in ipairs(modes) do
    for _, arrow in ipairs(arrows) do
        -- Disable normal arrow key
        vim.keymap.set(mode, "<" .. arrow .. ">", "<Nop>", { noremap = true, silent = true })
        -- Disable arrow key with Shift
        vim.keymap.set(mode, "<S-" .. arrow .. ">", "<Nop>", { noremap = true, silent = true })
    end
end
