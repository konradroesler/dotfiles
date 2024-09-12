-- Telescope
-- Open file browser
-- vim.keymap.set("n", "<leader>pv", require "telescope".extensions.file_browser.file_browser, { noremap = true })

-- Moves the selected block down/up a line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Joins the current line with the line below
vim.keymap.set("n", "J", "mzJ`z")
-- Scrolls down/up half a page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Centers on search term while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Paste from clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
-- Yank selected text to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- Yank current line to clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- Delete selected text without affecting registers
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- Disable macro recording key
vim.keymap.set("n", "Q", "<nop>")
-- Format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
-- Move through quickfix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- Move through location list
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- Search and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
