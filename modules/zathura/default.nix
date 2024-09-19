{ pkgs, ... }:

{
	programs.zathura.enable = true;
	xdg.configFile."zathura/zathurarc".source = ./zathurarc;
}
