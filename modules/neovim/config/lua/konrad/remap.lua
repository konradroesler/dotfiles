-- Telescope file browser
-- vim.keymap.set("n", "<leader>pv", require "telescope".extensions.file_browser.file_browser, { noremap = true })

-- Remove highlighting from last search
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Map floating window for diagnostic
vim.api.nvim_set_keymap("n", "<leader>df", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
