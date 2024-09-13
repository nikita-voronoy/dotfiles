return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        lazy = true,
        config = false,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
        },
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                    -- { name = 'LuaSnip' },
                    -- { name = 'buffer' }
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if vim.snippet.active({ direction = 1 }) then
                            vim.schedule(function()
                                vim.snippet.jump(1)
                            end)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                }),
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            local telescope = require("telescope.builtin")

            -- lsp_attach is where you enable features that only work
            -- if there is a language server active in the file
            local lsp_attach = function(client, bufnr)
                local opts = { buffer = bufnr }
                require('lazydev').find_workspace(bufnr)
                lsp_zero.buffer_autoformat()

                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gd', telescope.lsp_definitions, opts)
                vim.keymap.set('n', 'gD', telescope.lsp_type_definitions, opts)
                vim.keymap.set('n', 'gi', telescope.lsp_implementations, opts)
                vim.keymap.set('n', 'go', telescope.lsp_type_definitions, opts)
                vim.keymap.set('n', 'gr', telescope.lsp_references, opts)
                vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', 'cr', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, opts)
            end

            lsp_zero.extend_lspconfig({
                sign_text = {
                    error = '✘',
                    warn = '▲',
                    hint = '⚑',
                    info = '»',
                },
                lsp_attach = lsp_attach,
                capabilities = require('cmp_nvim_lsp').default_capabilities()
            })

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                }
            })
        end
    }
}
