return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					vim.lsp.enable(server_name)
				end,
				rust_analyzer = function() end,
			},
		})
	end,
}
