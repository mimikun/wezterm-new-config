# wezterm new configs

## Plugins

https://github.com/MLFlexer/modal.wezterm

https://github.com/xarvex/presentation.wez

https://github.com/michaelbrusegard/tabline.wez

https://github.com/rootiest/battery.wez

## Directory Structure (development)
```txt
.
├── plugins_tabline-wez_init.lua
├── plugins_battery-wez_init.lua
├── plugins_modal-wezterm_init.lua
├── plugins_presentation-wez_init.lua
├── plugins
│   ├── battery-wez
│   │   └── init.lua
│   ├── modal-wezterm
│   │   └── init.lua
│   ├── presentation-wez
│   │   └── init.lua
│   └── tabline-wez
│       ├── extensions.lua
│       ├── init.lua
│       ├── options.lua
│       └── sections.lua
├── event.lua
├── format.lua
├── global.lua
├── hoge
├── kabegami.lua
├── keybinds.lua
├── launchmenu.lua
├── mousebinds.lua
├── README.md
├── status.lua
├── stylua.toml
└── wezterm.lua
```
