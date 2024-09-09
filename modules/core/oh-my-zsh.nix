{ lib, config, pkgs, ... }:

{
  oh-my-zsh = {
    enable = true;
    # TODO install "thefuck"
    plugins = [ "git" ];
    theme = "robbyrussell";
  };
}
