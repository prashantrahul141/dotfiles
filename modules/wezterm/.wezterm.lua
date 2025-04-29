local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font 'FiraCode Nerd Font'
config.colors = {
    indexed = {
        [0] = '#af8700',
        [1] = '',
    },
}

return config
