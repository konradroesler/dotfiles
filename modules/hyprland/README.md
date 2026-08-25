### Suggested file structure
Using `xdg.configFile` to add all files to `.config/hypr/`, use this suggested structure:

```
hyprland/
├── hypr/
│   ├── modules/
│   │   ├── autostart.lua
│   │   ├── config.lua
│   │   ├── keybinds.lua
│   │   ├── monitors.lua
│   │   ├── windowrules.lua
│   │   └── workspaces.lua
│   ├── hyprland.lua
│   └── hyprlock.conf
├── default.nix
├── hyprland.nix
└── hyprlock.nix
```

As of the 26.05 stable release, only the hyprland config supports lua.
