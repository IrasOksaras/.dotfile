local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.use_ime = true

config.default_prog = { 'zsh' }

config.window_background_opacity = 0.85
config.text_background_opacity = 0.8

config.font_size = 12.5
config.font = wezterm.font("HackGen Console NF", {weight="Regular", stretch="Normal"})

config.color_scheme = 'Palenight (Gogh)'

config.exit_behavior = 'Hold'

return config
