{ pkgs, ... }:

let
  font = "JetBrainsMono Nerf Font";
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      window.dimensions = {
        columns = 100;
        lines = 30;
      };
      window.opacity = 1;
      window.dynamic_padding = true;
      window.padding = {
        x = 5;
        y = 5;
      };
      scrolling.history = 10000;

      font = {
      # normal.family = font;
      # bold.family = font;
      # italic.family = font;
        size = 18;
      };
    };
  };
}
