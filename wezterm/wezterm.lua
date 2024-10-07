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

config.keys = {
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- launch in full screen
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})

	window:gui_window():toggle_fullscreen()
end)

return config
