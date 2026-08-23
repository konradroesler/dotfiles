




{pkgs, ...}: {
  programs.hyprland.enable = true;
  xdg.portal = {
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
