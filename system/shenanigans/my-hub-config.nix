{pkgs, ...}: {
  services.tailscale.enable = true;

  systemd.user.services.my-hub = {
    description = "Personal hub web server";
    wantedBy = ["default.target"];
    environment = {
      HUB_SITE = "%h/repos/my-hub/site";
      HUB_DATA = "%h/repos/my-hub/data";
    };
    serviceConfig = {
      ExecStart = "${pkgs.python3}/bin/python3 %h/repos/my-hub/server.py";
      WorkingDirectory = "%h/repos/my-hub";
      Restart = "on-failure";
    };
  };
}
