-- Import modules
local wezterm = require 'wezterm' -- default wezterm module
local appearance = require 'appearance'

-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()

-- (This is where our config will go)
if appearance.is_dark() then
	config.color_scheme = "Tomorrow Night"
else
	config.color_scheme = "Tomorrow (light) (terminal.sexy)"
end

config.font = wezterm.font('Menlo')
config.font_size = 13

-- Returns our config to be evaluated. We mus always do this at the bottom of this file
return config
