return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    -- or                              , branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>f", "", {
            desc = "Find/Grep/Help",
        })
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {
            desc = "Find files in project",
        })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
            desc = "Find string in project files",
        })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {
            desc = "Find the buffers",
        })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
            desc = "Find the help",
        })
    end,
}
