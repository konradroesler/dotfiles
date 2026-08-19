{ pkgs, lib, inputs, ... }:
{
  home.packages = with pkgs; [
		wpaperd
	];

	home.file.".config/wpaperd/config.toml".text = ''[default]
path = "/home/konrad/repos/ankiwallpaper/images"
duration = "30s"
	'';
}
# path = "/home/konrad/desk/temp"
