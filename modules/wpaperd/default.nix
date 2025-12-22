{ pkgs, lib, inputs, ... }:
{
  home.packages = with pkgs; [
		wpaperd
	];

	home.file.".config/wpaperd/config.toml".text = ''
[default]
path = "/home/konrad/repos/ankiwallpaper/image_collection"
  '';
}
/*
duration = "10s"
mode = "center"
sorting = "descending"
transition = "fade"
transition_duration = "200"

*/
