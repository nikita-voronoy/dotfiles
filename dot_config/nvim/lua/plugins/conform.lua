return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "goimports", "gofumpt" },
				-- cpp = { "clang_format" },
				make = { "checkmake" },
				lua = { "stylua" },
				hcl = { "terragrunt_hclfmt" },
				terraform = { "terraform_fmt" },
				tf = { "terraform_fmt" },
				["terraform-vars"] = { "terraform_fmt" },
				bash = { "shfmt", "shellharden" },
				html = { "prettier" },
				yaml = { "prettier" },
			},

			formatters = {
				prettier_embedded = {
					command = "prettier",
					args = { "--stdin-filepath", "temp.html" },
					range = true,
				},
			},

			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
			},

			-- Логирование ошибок
			log_level = vim.log.levels.WARN,
		})
	end,
}
