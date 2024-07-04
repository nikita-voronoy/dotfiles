return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		{ "yioneko/nvim-vtsls" },
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local servers = require("core.lsp-config").servers

		local lspconfig = require("lspconfig")
		lspconfig.tsserver.setup({
			capabilities = capabilities,
		})

		local on_attach = function(client, bufnr)
			vim.api.nvim_create_autocmd("BufWritePost", {
				buffer = bufnr,
				callback = function()
					vim.lsp.inlay_hint(bufnr, true)
				end,
			})
		end

		for server, config in pairs(servers) do
			on_attach = on_attach
			capabilities = capabilities
			lspconfig[server].setup(config)
		end

		local telescope = require("telescope.builtin")

		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "<leader>gd", telescope.lsp_definitions, {})
		vim.keymap.set("n", "<leader>gr", telescope.lsp_references, {})
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	end,
}
