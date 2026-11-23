-- Import modules
local wezterm = require 'wezterm' -- default wezterm module
local appearance = require 'appearance'
local act = wezterm.action

-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()

-- (This is where our config will go)
-- color scheme
if appearance.is_dark() then
	config.color_scheme = "Tokyo Night"
else
	config.color_scheme = "Tomorrow Night Eighties (Gogh)"
end

-- fonts
config.font = wezterm.font('Menlo')
config.font_size = 13

-- windows styling
if appearance.is_dark() then
	config.window_background_opacity = 0.7
else
	config.window_background_opacity = 0.9
end

config.macos_window_background_blur = 30

config.window_decorations = 'RESIZE' -- Removes top bar from the terminal
config.window_frame = {
	font = wezterm.font('Menlo'),
	font_size = 14
}

-- Adding status bar to the top right of the screen

-- WezTerm event update-status is emiited when the terminal is ready to have its status updated
wezterm.on('update-status', function(window) 

	-- utf8 character for the powerline left facing solid arrow
	local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

	-- resolved_pallete is the currently active colour scheme
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

-- Key bindings
config.keys = {
	-- In the terminal 'ESC + f' and 'ESC + b' jump between words
	{
		-- When the left arrow is pressed
		key = 'LeftArrow',
		-- With the "Option" key modifier held down
		mods = 'OPT',
		-- Perform this action, in this case - sending ESC + b to the terminal
		action = wezterm.action.SendString '\x1bb'
	},
	{
		key = 'RightArrow',
		mods = 'OPT',
		action = wezterm.action.SendString '\x1bf'
	},
	{
    	key = "c",
    	mods = "CMD",
    	action = wezterm.action_callback(function(window, pane)
      		local sel = window:get_selection_text_for_pane(pane)
      		local proc = pane:get_foreground_process_name() or ""
      		if sel and sel ~= "" then
        		-- WezTerm has its own selection (e.g. Shift+drag, or not in nvim): copy it
        		window:perform_action(act.CopyTo("Clipboard"), pane)
      		elseif proc:match("nvim$") then
        		-- Send the escape code for Cmd+C (Neovim reads it as <D-c>).
        		-- Only for Neovim: other programs (e.g. zsh) would type it as "9;9u"
        		window:perform_action(act.SendString("\x1b[99;9u"), pane)
      		end
    	end),
  },
}

-- Returns our config to be evaluated. We mus always do this at the bottom of this file
return config
