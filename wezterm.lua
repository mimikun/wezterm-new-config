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

-- Load mouse settings
require("config.mouse")(config)

-- Load default program settings
require("config.programs")(config)

-- Load kabegami settings, if only `is_human_rights=true`
if g.is_human_rights then
    require("config.kabegami")(config)
end

-- Load Launcher-menu settings, if only `hostname!=azusa`
if not g.is_azusa then
    require("config.menu")(config)
end

-- NOTE: Load some Plugins
--local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
--tabline.setup(require("plugins_tabline-wez_init"))

-- NOTE: Load some utils
-- Debug Log print module
require("utils.log").debug_log_print(config)

-- Returns a table with ALL-configs
return config
