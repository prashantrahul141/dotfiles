-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Tinacious Design (Dark)"

-- tabs visible only if one is there.
config.hide_tab_bar_if_only_one_tab = true

-- window bg opacity
config.window_background_opacity = 0.8

-- Spawn a fish shell in login mode
config.default_prog = { "/home/linuxbrew/.linuxbrew/bin/nu" }

config.font = wezterm.font("FiraCode Nerd Font")

-- and finally, return the configuration to wezterm
return config
