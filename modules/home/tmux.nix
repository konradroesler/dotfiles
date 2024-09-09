{ lib, config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 10000;
    plugins = with pkgs; [ ];
    extraConfig = ''
    '';
  };
}
