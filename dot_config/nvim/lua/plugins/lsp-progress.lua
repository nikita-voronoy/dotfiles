return {
    'linrongbin16/lsp-progress.nvim',
    config = function()
        require('lsp-progress').setup({})
        require("lualine").setup({
            sections = {
                lualine_c = {
                    function()
                        return require('lsp-progress').progress(
                            {
                                max_size = 55
                            }
                        )
                    end,
                },
            }
        })
        vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
        vim.api.nvim_create_autocmd("User", {
            group = "lualine_augroup",
            pattern = "LspProgressStatusUpdated",
            callback = require("lualine").refresh,
        })
    end
}
