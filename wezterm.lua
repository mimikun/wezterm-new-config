-- ref: https://github.com/michaelbrusegard/dotfiles/blob/5acb063/modules/wezterm/config/wezterm.lua

-- Load wezterm core module
local wezterm = require("wezterm")

-- Define path sep
local path_sep = (wezterm.target_triple == "x86_64-pc-windows-msvc") and "\\" or "/"

-- Expand package.path
package.path = package.path .. ";" .. wezterm.config_dir .. path_sep .. "lua" .. path_sep .. "?.lua"

-- Create a special type table object
local config = wezterm.config_builder and wezterm.config_builder() or {}

-- Load global module
local g = require("config.global")

-- NOTE: Load some Configs

-- Load color settings
require("config.colors")(config)

-- Load appearance settings
require("config.appearance")(config)

-- Load window settings
require("config.window")(config)

-- Load font settings
require("config.fonts")(config)

-- Load keyboard settings
require("config.keyboard")(config)

-- Load default program settings
require("config.programs")(config)

-- Load Launcher-menu settings
if not g.is_azusa then
    require("config.menu")(config)
end

-- NOTE: Load some Plugins
--local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
--tabline.setup(require("plugins_tabline-wez_init"))

local function debug_log_print()
    --wezterm.log_info("Home Dir " .. global.home)
    --wezterm.log_info("Config Dir " .. global.config_dir)
    --wezterm.log_info("Config file " .. global.config_file)
    --wezterm.log_info("Version " .. global.version)
    --wezterm.log_info("Exe dir " .. global.exec_dir)
    --wezterm.log_info("Hostname " .. hostname)
    --wezterm.log_info("Path sep " .. global.path_sep)
    --wezterm.log_info("Running under wsl" .. tostring(global.is_wsl))
    config.debug_key_events = true
end
debug_log_print()

-- Returns a table with ALL-configs
return config
