return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	},
	config = function()
		vim.api.nvim_create_autocmd("TermOpen", {
			pattern = "*lazygit*",
			callback = function()
				vim.opt_local.mouse = ""
			end,
		})
	end,
}
