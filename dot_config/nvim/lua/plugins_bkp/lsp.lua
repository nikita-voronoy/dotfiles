return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "onsails/lspkind.nvim" },
        { "saadparwaiz1/cmp_luasnip" },
        { "windwp/nvim-autopairs" },
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "yioneko/nvim-vtsls" },
    },
    config = function()
        local lsp_zero = require("lsp-zero")
        local lspkind = require("lspkind")

        require("luasnip.loaders.from_vscode").load {}

        local lsp_attach = function(client, bufnr)
            local opts = { buffer = bufnr }

            lsp_zero.buffer_autoformat()

            vim.keymap.set("n", "<leader>K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
            vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
            vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
            vim.keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
            vim.keymap.set("n", "<leader>go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
            vim.keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
            vim.keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
            vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
            vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end

        lsp_zero.extend_lspconfig({
            sign_text = true,
            lsp_attach = lsp_attach,
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })

        lsp_zero.extend_lspconfig({
            lsp_attach = lsp_attach,
        })

        require 'lspconfig'.docker_compose_language_service.setup {}
        require("lspconfig").lua_ls.setup({})
        require("lspconfig").gopls.setup({})
        require("lspconfig").taplo.setup({})

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )

        cmp.setup({
            preselect = "None",
            completion = {
                completeopt = "menuone,noinsert",
                autocomplete = { "InsertEnter", "TextChanged" },
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = {
                { name = "nvim_lsp", priority = 1000 },
                { name = "luasnip",  priority = 500 },
            },
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            formatting = {
                format = lspkind.cmp_format({
                    with_text = true, -- do not show text alongside icons
                    maxwidth = 50,
                    before = function(entry, vim_item)
                        local m = vim_item.menu and vim_item.menu or ""
                        if #m > 50 then
                            vim_item.menu = string.sub(m, 1, 50) .. "..."
                        end
                        return vim_item
                    end,
                }),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
                        cmp.select_next_item()
                    elseif vim.snippet.active({ direction = 1 }) then
                        vim.schedule(function()
                            vim.snippet.jump(1)
                        end)
                    elseif require("luasnip").jumpable(1) then
                        vim.schedule(function()
                            require("luasnip").jump(1)
                        end)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif vim.snippet.active({ direction = -1 }) then
                        vim.schedule(function()
                            vim.snippet.jump(-1)
                        end)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
        })
    end,
}
