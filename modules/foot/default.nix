{
  lib,
  config,
  ...
}: {
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "FiraCodeNerdFont:size=14";
        pad = "0x0 center";
        initial-window-size-pixels = "1400x900";
      };
      cursor = {
        color = "1A1826 D9E0EE"; # Catppuccin
        blink = false;
        style = "block";
        beam-thickness = "2";
        underline-thickness = "2";
      };
      colors-dark = import ./kanagawa.nix;
			tweak = {
        font-monospace-warn = "no";
        sixel = "yes";
      };
    };
  };
}
