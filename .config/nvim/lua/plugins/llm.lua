return {
	"gsuuon/model.nvim",

	-- Don't need these if lazy = false
	cmd = { "M", "Model", "Mchat" },
	init = function()
		vim.filetype.add({
			extension = {
				mchat = "mchat",
			},
		})
	end,
	ft = "mchat",

	keys = {
		{ "<C-m>d", ":Mdelete<cr>", mode = "n" },
		{ "<C-m>s", ":Mselect<cr>", mode = "n" },
		{ "<C-m><space>", ":Mchat<cr>", mode = "n" },
	},

	config = function()
		local kobold = require("model.providers.kobold")

		require("model").setup({
			prompts = {
				deepseek = {
					provider = kobold,
					builder = function(input, context)
						return {
							prompt = "<|system|>"
								.. (context.args or "You are a helpful assistant")
								.. "\n</s>\n<|user|>\n"
								.. input
								.. "</s>\n<|assistant|>",
							stops = { "</s>" },
						}
					end,
				},
			},
		})
	end,
	-- config = function()
	--   require('model').setup({
	--     prompts = {..},
	--     chats = {..},
	--     ..
	--   })
	--
	--   require('model.providers.llamacpp').setup({
	--     binary = '~/path/to/server/binary',
	--     models = '~/path/to/models/directory'
	--   })
	--end
}
