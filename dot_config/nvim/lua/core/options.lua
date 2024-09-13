vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.opt.pumheight = 8

vim.o.pumwidth = 40
vim.o.ignorecase = true
vim.o.showmatch = true
vim.o.scrolloff = 10
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Rust
vim.g.rustaceanvim = {
    server = {
        settings = {
            ["rust-analyzer"] = {
                -- imports = {
                --     preferPrelude = true
                -- },
                checkOnSave = {
                    allFeatures = true,
                    command = "clippy",
                    extraArgs = {
                        "--",
                        "--no-deps",
                        "-Dclippy::all",
                    },
                },
                -- completion = {
                --     autoimport = {
                --         enable = true,
                --     },
                --     postfix = {
                --         enable = true,
                --     },
                -- },
                -- lens = {
                --     enable = true,
                --     references = {
                --         enable = true,
                --     },
                -- },
                -- inlayHints = {
                --     bindingModeHints = {
                --         enable = true,
                --     },
                --     chainingHints = {
                --         enable = true,
                --     },
                --     closingBraceHints = {
                --         enable = true,
                --         minLines = 25,
                --     },
                --     closureReturnTypeHints = {
                --         enable = true,
                --     },
                --     closureCaptureHints = {
                --         enable = true
                --     },
                --     -- lifetimeElisionHints = {
                --     --     enable = true,
                --     --     useParameterNames = true,
                --     -- },
                --     -- maxLength = 25,
                --     parameterHints = {
                --         enable = true,
                --     },
                --     -- reborrowHints = {
                --     --     enable = "always",
                --     -- },
                --     renderColons = true,
                --     typeHints = {
                --         enable = true,
                --         hideClosureInitialization = true,
                --         hideNamedConstructor = true,
                --     },
                -- },
            },
        },
    },
}
--
-- CTRL+S
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
-- Split windows
vim.keymap.set("n", "<leader>w", "", { noremap = true, silent = false, desc = "Window manager" })
vim.keymap.set("n", "<leader>ws", "<Cmd>split<CR>", { noremap = true, silent = false, desc = "Split by -" })
vim.keymap.set("n", "<leader>wv", "<Cmd>vsplit<CR>", { noremap = true, silent = false, desc = "Split by |" })

-- Disable arrow keys (including with Shift)
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
