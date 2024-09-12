{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = [ 
      "$mod, B, exec, firefox"
      "$mod, Q, exec, kitty" 
      "$mod, F, fullscreen"
    ];
  };
}
