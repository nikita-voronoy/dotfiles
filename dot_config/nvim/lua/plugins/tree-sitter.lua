return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},
			indent = {
				enable = true,
			},
			ensure_installed = { "rust", "markdown", "markdown_inline" },
			matchup = { enable = true },
			incremental_selection = { enable = true },
			playground = { enable = true },
		})
	end,
}
