-- (relative) line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
-- Make tabs 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
-- smart
vim.opt.smartindent = true
-- Makes long lines break at the screen edge
-- so they are fully visible
vim.opt.wrap = true
-- Disable swapfiles and specify 
-- undohistory location
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
-- Don't highlight searches
vim.opt.hlsearch = false
-- Update search "incrementally" while typing
vim.opt.incsearch = true
-- 24-bit RGB instead of 256-color mode
vim.opt.termguicolors = true
-- Minimum of 8 lines between cursor and edge
vim.opt.scrolloff = 8
-- Permanently adds sign column
vim.opt.signcolumn = "yes"
-- '@' and '-' are valid file name characters
vim.opt.isfname:append("@-@")
-- Frequency at which certain events are triggered
vim.opt.updatetime = 750
-- Highlight 80th column
vim.opt.colorcolumn = "80"
-- Best mapleader
vim.g.mapleader = " "
-- Automatic save on buffer switch and other
-- potentially file altering operations
vim.opt.autowrite = true
vim.opt.autowriteall = true
-- Apply same indentation level as previous line
vim.opt.autoindent = true
-- Length of time where keykombinations are registered
vim.o.timeout = true
vim.o.timeoutlen = 1000
