My personal dotfiles for all systems, configured using Nix and Home Manager.

I'm still figuring this out so theres no guarantee the flakes will actually build :)

### To-Do
- everything
- darwin config

### Run on NixOs VM

Use graphical installer to install NixOs (without desktop). Then do the following steps:

```shell
nix-shell -p git
mkdir .dotfiles`
git clone https://github.com/konradroesler/dotfiles.git .dotfiles
cd .dotfiles
rm hosts/<hostname>/hardware-configuration.nix
cp /etc/nixos/hardware-configuration.nix hosts/<hostname>/
sudo nixos-rebuild switch --flake .#<hostname>
```
