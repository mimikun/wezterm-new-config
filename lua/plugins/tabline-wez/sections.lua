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
        tabline_y = { "datetime" },
        tabline_z = { { "battery" } },
    }
end

--[[
return function(config, battery)

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

    return {
        tabline_a = {
            key_state,
            -- TODO: it
        },
        tabline_b = {
            "mode",
        },
        tabline_c = {
            " ",
            -- TODO: it
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
            -- TODO: it
            {
                "ram",
                cond = true,
            },
            --require("config.global").is_human_rights()
            {
                "cpu",
                cond = false,
            },
        },
        tabline_y = {
            -- date
            --{ ja_date },
            {
                "datetime",
                style = "%Y年%m月%d日",
                --cond = true,
            },
            -- time
            {
                "datetime",
                style = "%H:%M:%S",
                --cond = true,
            },
        },
        tabline_z = {
            {
                battery.get_battery_icons,
                --cond = false,
            },
        },
    }
end
]]
