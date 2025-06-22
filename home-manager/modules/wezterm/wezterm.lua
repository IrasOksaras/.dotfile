local wezterm = require "wezterm"
local config = wezterm.config_builder()

config.enable_wayland = true
config.enable_tab_bar = false

config.use_ime = true
-- config.treat_east_asian_ambiguous_width_as_wide = true

config.default_prog = { "zsh" }

config.window_background_opacity = 0.6
-- config.window_background_opacity = 0.9
config.text_background_opacity = 1.0

config.font_size = 12.7
config.font = wezterm.font("HackGen Console NF", {weight="Regular", stretch="Normal"})

config.color_scheme = "Tokyo Night Moon"

config.exit_behavior = "CloseOnCleanExit"

config.keys = {
  {
    key = "CapsLock",
    mods = "",
    action = wezterm.action.SendKey { key = "Control" },
  },
}

--config.serial_ports = {}
--
--for _, val in ipairs(wezterm.read_dir "dir") do
--  if string.find(val, "/dev/ttyUSB%d*") then
--    data = {
--      name = string.gsub(val, "/dev/ttyUSB", "usb"),
--      port = val,
--      baud = 9600,
--    }
--
--    table.insert(config.serial_ports, data)
--    end
--  end

return config
