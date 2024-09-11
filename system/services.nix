{ username, ... }:

{
  services.xserver.xkb = {
    layout = "en";
    variant = "";
  };

  services.getty.autologinUser = username;
}
