My personal dotfiles for all systems, configured using Nix and Home Manager.

## Screenshots

<img src="https://github.com/konradroesler/dotfiles/blob/main/assets/screenshots/screen_nvim.png" width="800">

I'm still figuring this out so theres no guarantee the flakes will actually build :)

## To-Do
- everything darwin config
- manage host specific configuration

## Notes

(wayland) If audio is not working try removing `~/.local/state/wireplumber` and reboot.

#### Run on NixOs VM or metal

Use graphical installer to install NixOs (without desktop). Then do the following steps:

```shell
nix-shell -p git
mkdir .dotfiles
git clone https://github.com/konradroesler/dotfiles.git .dotfiles
cd .dotfiles
rm hosts/<hostname>/hardware-configuration.nix
cp /etc/nixos/hardware-configuration.nix hosts/<hostname>/
sudo nixos-rebuild switch --flake .#<hostname>
```

## Sources

A lot of this repository was originally taken from other great NixOs configurations, a few of them are:

[ryan4yin](https://github.com/ryan4yin/nix-config), [Frost-Phoenix](https://github.com/Frost-Phoenix/nixos-config), [redyf](https://github.com/redyf/nixdots), [gpskwlkr](https://github.com/gpskwlkr/nixos-hyprland-flake)
