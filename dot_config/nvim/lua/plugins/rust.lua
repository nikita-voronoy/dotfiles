return {
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        lazy = false,
    },
    {
        "saecki/crates.nvim",
        tag = "stable",
        config = function()
            local crates = require("crates")
            crates.setup({
                popup = {
                    autofocus = true,
                },
                lsp = {
                    enabled = true,
                    hover = true,
                    completion = true,
                    actions = true,
                },
                completion = {
                    cmp = {
                        enabled = true,
                    },
                    crates = {
                        enabled = true,
                        min_chars = 3,
                        max_results = 8,
                    },
                },
            })
            require("crates.completion.cmp").setup()

            vim.api.nvim_create_autocmd("BufEnter", {
                pattern = "Cargo.toml",
                callback = function()
                    vim.keymap.set("n", "<leader>cc", crates.show_popup, { noremap = true, silent = true })
                    vim.keymap.set("n", "<leader>cf", crates.show_features_popup, { noremap = true, silent = true })
                end,
            })
        end,
    },
}
