local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- ещё темы 'Terminal Basic', 'Konsolas' или 'Terminal Basic'
config.color_scheme = 'CGA'

-- вместо alt+enter сделать распахивание по F11
config.keys = {
  { key = 'F11', mods = 'NONE', action = wezterm.action.ToggleFullScreen },
  { key = 'Enter', mods = 'ALT', action = wezterm.action.DisableDefaultAssignment },
}

return config
