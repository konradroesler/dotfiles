{
  pkgs,
  username,
  ...
}: {
  services.dbus.enable = true;
  # Brightness control (wayland)
  services.illum.enable = true;
  services.openssh.enable = true;
	services.blueman.enable = true;
	# USB
	services.devmon.enable = true;
	services.gvfs.enable = true; 
	services.udisks2.enable = true;
}
