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
