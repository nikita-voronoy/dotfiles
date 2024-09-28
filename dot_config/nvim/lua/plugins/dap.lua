return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {},
        },
    },
    config = function()
        local dap = require("dap")
        local widgets = require("dap.ui.widgets")
        local dapui = require("dapui")

        dapui.setup({
            layouts = {
                {
                    elements = {
                        "scopes",
                        "breakpoints",
                        -- "stacks",
                        -- "watches",
                    },
                    size = 40,
                    position = "left",
                },

                {
                    elements = {
                        "repl",
                        "console",
                    },
                    size = 10,
                    position = "bottom",
                },
            }
        })

        vim.keymap.set("n", "<leader>d", "", { silent = true, desc = "Debug options" })
        vim.keymap.set("n", "<leader>dg", dap.toggle_breakpoint, { silent = true })
        vim.keymap.set("n", "<leader>K", function() dapui.eval(nil, { enter = true }) end,
            { silent = true, noremap = true, desc = "Hover for debug " })
        vim.keymap.set("n", "<leader>dc", dap.continue, { silent = true, desc = "Continue" })
        vim.keymap.set("n", "<leader>dw", widgets.hover, { silent = true, desc = "Hover over widgets" })
        vim.keymap.set("n", "<leader>ds", dap.session, { silent = true, desc = "Session" })
        vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { silent = true, desc = "Repl toggle" })
        vim.keymap.set("n", "<leader>dR", dap.restart, { silent = true, desc = "Repl toggle" })
        vim.keymap.set("n", "<leader>dS", dap.terminate, { silent = true, desc = "Stop debug" })

        vim.api.nvim_set_hl(0, 'DapBreakpointSign', { fg = '#FF0000' })

        vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpointSign', linehl = '', numhl = '' })

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end
}
