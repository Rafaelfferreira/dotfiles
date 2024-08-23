-- Import modules
local wezterm = require 'wezterm' -- default wezterm module
local appearance = require 'appearance'

-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()

-- (This is where our config will go)
-- config.color_scheme = 'Tomorrow (light) (terminal.sexy)'
if appearance.is_dark() then
	config.color_scheme = "Tomorrow Night"
else
	config.color_scheme = "Tomorrow (light) (terminal.sexy)"
end

config.font = wezterm.font({ family = 'Berkeley Mono' })
config.font_size = 12


-- Returns our config to be evaluated. We mus always do this at the bottom of this file
return config
