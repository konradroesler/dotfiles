My NeoVim config managed using Nix but using lua.

Configuring neovim through nix means not using mason to install the lsp's, so nvim-lspconfig is used standalone and language servers have to be installed either as system packages or inside dev shells.

### ToDo

- copy some more lua code
- [better `init.lua`](https://lazy.folke.io/installation)


### Credits
The nix integration and options/remaps are inspired by this nice [config](https://github.com/Kidsan/nixos-config).
