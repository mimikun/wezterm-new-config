return function(config, battery)
    return {
        tabline_a = { "mode" },
        tabline_b = { "workspace" },
        tabline_c = { " " },
        tab_active = {
            "index",
            { "parent", padding = 0 },
            "/",
            { "cwd", padding = { left = 0, right = 1 } },
            { "zoomed", padding = 0 },
        },
        tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
        tabline_x = { "ram", "cpu" },
        tabline_y = { "datetime", "battery" },
        tabline_z = { "domain" },
    }
end
