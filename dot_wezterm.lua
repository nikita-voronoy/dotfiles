-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
---@type Wezterm
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.default_prog = { '/bin/sh', '-c', 'tmux new-session -A -s main' }
config.enable_tab_bar = false
config.enable_wayland = true
config.animation_fps = 144
config.font_size = 12
config.window_frame = {
    border_left_width = "0cell",
    border_right_width = "0cell",
    border_top_height = "0cell",
    border_bottom_height = "0cell"
}


return config
