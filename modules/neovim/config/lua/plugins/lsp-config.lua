return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.enable({ "lua_ls", "pyright", "nil_ls" })

			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition)
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation)
			vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)
		end,
	},
}
