local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.guicursor = ""

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	install = { },
	checker = { enabled = false },
})
require("konrad.set")
require("konrad.remap")
