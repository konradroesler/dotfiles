local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.lsp.enable({
	"lua_ls",
	"pyright",
	"nil_ls",
	"html",
	"cssls",
	"ts_ls",
})
