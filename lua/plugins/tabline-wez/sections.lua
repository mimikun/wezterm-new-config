local wezterm = require("wezterm")
local g = require("config.global")
local is_not_windows = not g.is_windows
local is_human_rights = g.is_human_rights

local nf = wezterm.nerdfonts

local SPACE_1 = " "
local normal_key_icon = nf.md_alphabetical_variant .. SPACE_1
local leader_key_icon = nf.md_keyboard_outline .. SPACE_1
local ime_icon = nf.md_syllabary_hiragana .. SPACE_1

local function convertWeekdayToJapanese(dateString)
    -- 英語の曜日短縮表記と日本語の曜日の対応表
    local weekdays = {
        ["Sun"] = "日",
        ["Mon"] = "月",
        ["Tue"] = "火",
        ["Wed"] = "水",
        ["Thu"] = "木",
        ["Fri"] = "金",
        ["Sat"] = "土",
    }

    -- 日付文字列から曜日部分を抽出して変換
    local result = dateString:gsub("%((%a+)%)", function(weekday)
        return "(" .. (weekdays[weekday] or weekday) .. ")"
    end)

    return result
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
            -- NOTE: can't work now
            --key_state,
        },
        tabline_b = { "mode" },
        tabline_c = {},
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
                    return is_not_windows
                end,
            },
            {
                "cpu",
                cond = function()
                    return is_not_windows
                end,
            },
        },
        tabline_y = {
            -- TODO: checknow
            -- date
            {
                "datetime",
                style = "%Y年%m月%d日(%a)",
                fmt = convertWeekdayToJapanese,
            },
            -- time
            {
                "datetime",
                style = "%H:%M:%S",
                cond = function()
                    return is_human_rights
                end,
            },
        },
        tabline_z = {
            --{
            --battery.get_battery_icons,
            --cond = function()
            --return g.is_azusa
            --end,
            --},
        },
    }
end
