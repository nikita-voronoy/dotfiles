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

    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { "rafamadriz/friendly-snippets" },
            { "hrsh7th/cmp-path" },
            { "L3MON4D3/LuaSnip" },
            { "saadparwaiz1/cmp_luasnip" },
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            -- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            --
            -- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'path' },
                    { name = 'buffer' }
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                }),
            })
        end
    },

    {
        'L3MON4D3/LuaSnip',
        lazy = true,
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
    {
        "rafamadriz/friendly-snippets",
        lazy = true,
    },

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

            local lsp_attach = function(_, bufnr)
                local opts = { buffer = bufnr }
                require('lazydev').find_workspace(bufnr)
                lsp_zero.buffer_autoformat()

                vim.keymap.set('n', '<leader>gd', telescope.lsp_definitions, opts)
                vim.keymap.set('n', '<leader>gD', telescope.lsp_type_definitions, opts)
                vim.keymap.set('n', '<leader>gi', telescope.lsp_implementations, opts)
                vim.keymap.set('n', '<leader>go', telescope.lsp_type_definitions, opts)
                vim.keymap.set('n', '<leader>gr', telescope.lsp_references, opts)
                vim.keymap.set('n', '<leader>gs', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
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
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                }
            })
        end
    }
}
