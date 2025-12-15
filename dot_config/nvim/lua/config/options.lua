vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
	callback = function()
		vim.cmd("checktime")
	end,
})
vim.cmd.colorscheme("vscode")
vim.opt.termguicolors = true
vim.o.tabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true
