-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

local function get_terminal_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end

	return "Dark" -- default
end

local function get_theme_from(appearance)
	if appearance:find("Dark") then
		return "Vs Code Dark+ (Gogh)"
	end

	return "Vs Code Light+ (Gogh)"
end

-- Do config stuff
config.color_scheme = get_theme_from(get_terminal_appearance())
config.window_background_opacity = 0.75
config.hide_mouse_cursor_when_typing = false
config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config
