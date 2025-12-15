return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			ensure_installed = { "rust", "markdown", "markdown_inline" },
			incremental_selection = { enable = true },
		})
	end,
}
