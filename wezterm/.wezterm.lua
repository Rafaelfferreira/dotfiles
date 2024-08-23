-- Import modules
local wezterm = require 'wezterm' -- default wezterm module
local appearance = require 'appearance'

-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()

-- (This is where our config will go)
-- color scheme
if appearance.is_dark() then
	config.color_scheme = "Tokyo Night"
else
	config.color_scheme = "Tomorrow"
end

-- fonts
config.font = wezterm.font('Menlo')
config.font_size = 13

-- windows styling
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30

config.window_decorations = 'RESIZE' -- Removes top bar from the terminal
config.window_frame = {
	font = wezterm.font('Menlo'),
	font_size = 13
}

-- Adding status bar to the top right of the screen
wezterm.on('update-status', function(window)
	-- utf8 character for the powerline left facing solid arrow
	local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

	local color_scheme = window:effective_config().resolved_palette
	local bg = color_scheme.background
	local fg = color_scheme.foreground

	window:set_right_status(wezterm.format({
		-- Drawing the arrow
		{ Background = { Color = 'none' } },
		{ Foreground = { Color = bg } },
		{ Text = SOLID_LEFT_ARROW },

		-- Drawing the text
		{ Background = { Color = bg } },
		{ Foreground = { Color = fg } },
		{ Text = ' ' .. wezterm.hostname() .. ' ' }
	}))
end)

-- Returns our config to be evaluated. We mus always do this at the bottom of this file
return config
