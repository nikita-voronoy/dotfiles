local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", opts)

vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename variable" }))
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Diagnostics" }))

-- vim.keymap.set("x", "<leader>p", [["_dP]])
-- vim.keymap.set("v", "p", '"_dP', opts)
-- vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
