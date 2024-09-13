---@class LazyNvimSetup
---@field lazypath string The path to the lazy.nvim installation
local LazyNvimSetup = {}

---Creates a new instance of LazyNvimSetup
---@return LazyNvimSetup
function LazyNvimSetup:new()
    local instance = setmetatable({}, { __index = LazyNvimSetup })
    instance.lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    return instance
end

---Ensures that lazy.nvim is installed
function LazyNvimSetup:ensure_lazy_installed()
    local fs_stat = (vim.uv or vim.loop).fs_stat
    if not fs_stat(self.lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "--branch=stable",
            lazyrepo,
            self.lazypath
        })
    end
end

---Sets up the runtime path for lazy.nvim
function LazyNvimSetup:setup_rtp()
    vim.opt.rtp:prepend(self.lazypath)
end

---Configures lazy.nvim with specified settings
function LazyNvimSetup:configure_lazy()
    require("lazy").setup({
        spec = {
            { import = "plugins" },
        },
        checker = { enabled = true },
        change_detection = { notify = false },
    })
end

---Initializes lazy.nvim by running all necessary setup steps
function LazyNvimSetup:initialize()
    self:ensure_lazy_installed()
    self:setup_rtp()
    self:configure_lazy()
end

return LazyNvimSetup
