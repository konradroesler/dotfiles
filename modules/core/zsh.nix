{ lib, config, pkgs, ... }:

{

  imports = [
    oh-my-zsh = import ./oh-my-zsh.nix;
  ];

  config = { ... } @ input: {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };

      inherit oh-my-zsh;
    };
}
