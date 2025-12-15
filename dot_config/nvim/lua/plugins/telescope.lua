return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				path_display = { "truncate" },
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						preview_width = 0.55,
						preview_cutoff = 80,
					},
					width = 0.87,
					height = 0.80,
				},
				mappings = {
					i = {
						["<CR>"] = function(bufnr)
							require("telescope.actions").select_default(bufnr)
							vim.cmd("normal! zz")
						end,
					},
					n = {
						["<CR>"] = function(bufnr)
							require("telescope.actions").select_default(bufnr)
							vim.cmd("normal! zz")
						end,
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
				},
			},
		})
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
	end,
	keys = {
		{ "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
		{ "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
		{ "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
		{ "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
		{ "<leader>fo", function() require("telescope.builtin").oldfiles() end, desc = "Recent files" },
		{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code actions", mode = { "n", "v" } },
		{ "<leader>gd", function() require("telescope.builtin").lsp_definitions() end, desc = "Definitions" },
		{ "<leader>gi", function() require("telescope.builtin").lsp_implementations() end, desc = "Implementations" },
		{ "<leader>gr", function() require("telescope.builtin").lsp_references() end, desc = "References" },
	},
}
