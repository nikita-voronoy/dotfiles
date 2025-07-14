local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", opts)

local fzf = require("fzf-lua")
vim.keymap.set("n", "<leader>f", "", vim.tbl_extend("force", opts, { desc = "Files" }))
vim.keymap.set("n", "<leader>ff", fzf.files, vim.tbl_extend("force", opts, { desc = "Find files" }))
vim.keymap.set("n", "<leader>fg", fzf.live_grep, vim.tbl_extend("force", opts, { desc = "Live grep" }))
--- Lsp
vim.keymap.set("n", "<leader>c", "", vim.tbl_extend("force", opts, { desc = "Code" }))
vim.keymap.set("n", "<leader>ca", function()
	fzf.lsp_code_actions({ silent = true })
end, vim.tbl_extend("force", opts, { desc = "Code actions" }))
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename variable" }))
vim.keymap.set("n", "<leader>g", "", vim.tbl_extend("force", opts, { desc = "Go" }))
vim.keymap.set("n", "<leader>gd", fzf.lsp_definitions, vim.tbl_extend("force", opts, { desc = "Definitions" }))
vim.keymap.set("n", "<leader>gi", fzf.lsp_implementations, vim.tbl_extend("force", opts, { desc = "Implementations" }))
vim.keymap.set("n", "<leader>gr", fzf.lsp_references, vim.tbl_extend("force", opts, { desc = "References" }))
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Diagnostics" }))
fzf.register_ui_select()

-- vim.keymap.set("x", "<leader>p", [["_dP]])
-- vim.keymap.set("v", "p", '"_dP', opts)
-- vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
