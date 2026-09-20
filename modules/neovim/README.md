My NeoVim config managed using Nix but using lua.

Configuring neovim through nix means not using mason to install the lsp's, so nvim-lspconfig is used standalone and language servers have to be installed either as system packages or inside dev shells.

### To-Do

- [better `init.lua`](https://lazy.folke.io/installation)

### Credits
The nix integration and options/remaps are inspired by this nice [config](https://github.com/Kidsan/nixos-config).

### Handy neovim commands

- `:checkhealth`
- `:ConformInfo`
- `:LspInfo`
- `:Lazy`
- `:Inspect`
- `:InspectTree`

- `]d` and `[d` to move diagnostics

### On treesitter

I previously tried to manage treesitter through nix but after breaking changes in neovim 0.12 and changes everything seemed to break for me. So now nix no longer manages treesitters parsers, which is not the nix way, but lets me use this config on a non nix machine more easily.

### On neovim config with nix

What nix is currently managing is the formatters, linters, and lsps. As long as there is no better way to manage them using lua plugins, I'll keep that.

- lsp's installed through nix for native vim.lsp api to manage
- formatters installed through nix for conform plugin to manage
- linters installed through nix for vim.diagnostic to manage (not sure if this is actualy done well rn)
- highlighting installed through treesiterr plugin for treesitter plugin to manage
