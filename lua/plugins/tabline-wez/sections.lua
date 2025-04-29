local wezterm = require("wezterm")
local nf = wezterm.nerdfonts

local SPACE_1 = " "
local normal_key_icon = nf.md_alphabetical_variant .. SPACE_1
local leader_key_icon = nf.md_keyboard_outline .. SPACE_1
local ime_icon = nf.md_syllabary_hiragana .. SPACE_1

return function(config, battery)
    return {
        tabline_a = { "mode" },
        tabline_b = { "workspace" },
        tabline_c = { SPACE_1 },
        tab_active = {
            "index",
            { "parent", padding = 0 },
            "/",
            { "cwd", padding = { left = 0, right = 1 } },
            { "zoomed", padding = 0 },
        },
        tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
        tabline_x = { { "ram" }, { "cpu" } },
        tabline_y = {
            {
                "datetime",
                cond = function()
                    return false
                end,
            },
        },
        tabline_z = { { "battery" } },
    }
end

-- NOTE: Configuration under testing
--[[
local wezterm = require("wezterm")
local nf = wezterm.nerdfonts
local normal_key_icon = nf.md_alphabetical_variant .. " "
local leader_key_icon = nf.md_keyboard_outline .. " "
local ime_icon = nf.md_syllabary_hiragana .. " "

local function ja_date()
    local day_of_week_ja = { "日", "月", "火", "水", "木", "金", "土" }
    local wday = os.date("*t").wday
    local wday_ja = string.format("(%s)", day_of_week_ja[wday])
    return wezterm.strftime("%Y年%m月%d日 " .. wday_ja)
end

local function key_state(window)
    if window:leader_is_active() then
        return leader_key_icon
    elseif window:composition_status() then
        return ime_icon
    else
        return normal_key_icon
    end
end

return function(config, battery)
    return {
        tabline_a = {
            " ",
            -- NOTE: can't work now
            --key_state,
        },
        tabline_b = {
            "mode",
        },
        tabline_c = {
            " ",
        },
        tab_active = {
            -- index number
            "index",
            {
                "parent",
                padding = 0,
            },
            -- separator
            "/",
            {
                "cwd",
                padding = { left = 0, right = 1 },
            },
            {
                "zoomed",
                padding = 0,
            },
        },
        tab_inactive = {
            -- index number
            "index",
            {
                "process",
                padding = { left = 0, right = 1 },
            },
        },
        tabline_x = {
            {
                "ram",
                cond = function()
                    return true
                end,
            },
            {
                "cpu",
                cond = function()
                    return true
                end,
            },
        },
        tabline_y = {
            -- date
            -- NOTE: I want to use ja_date instead of datetime in the future
            {
                "datetime",
                style = "%Y年%m月%d日",
                cond = function()
                    return true
                end,
            },
            -- time
            -- NOTE: Disable it if you have a low spec PC.
            {
                "datetime",
                style = "%H:%M:%S",
                cond = function()
                    return false
                end,
            },
        },
        tabline_z = {
            -- battery
            -- NOTE: Disable it if you have a low spec PC.
            {
                battery.get_battery_icons,
                cond = function()
                    return false
                end,
            },
        },
    }
end
]]
