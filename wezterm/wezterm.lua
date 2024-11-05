local wezterm = require("wezterm")
local mux = wezterm.mux
local config = wezterm.config_builder()

config.color_scheme = "Aci (Gogh)"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.font_size = 16
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- disable ligatures
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.max_fps = 120

local theme_bg_color = "#0D1926"
local theme_light_color = "#C2C2C2"

config.colors = {
	tab_bar = {
		background = theme_bg_color,
		active_tab = {
			bg_color = "#050d15",
			fg_color = theme_light_color,
		},
		inactive_tab = {
			bg_color = theme_bg_color,
			fg_color = theme_light_color,
		},
		new_tab = {
			bg_color = theme_bg_color,
			fg_color = theme_light_color,
		},
	},
}

config.keys = {
	-- ctrl+shift+n to toggle full screen
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
	-- option+◀ to go backward-word
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bb" }),
	},
	-- option+▶ to go forward-word
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bf" }),
	},
	-- cmd+backspace to clear the current line
	{
		key = "Backspace",
		mods = "CMD",
		action = wezterm.action({ SendString = "\x15" }),
	},
	-- cmd+▶ to go to the end of the line
	{
		key = "LeftArrow",
		mods = "CMD",
		action = wezterm.action({ SendString = "\x01" }),
	},
	-- cmd+◀ to go to the start of the line
	{
		key = "RightArrow",
		mods = "CMD",
		action = wezterm.action({ SendString = "\x05" }),
	},
}

-- launch in full screen
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})

	window:gui_window():toggle_fullscreen()
end)

return config
