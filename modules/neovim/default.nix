{ lib, ... }:

{
  programs.neovim = {
    enalbe = true;
    extraConfig = lib.fileContents ./config/init.lua;
  };
}
