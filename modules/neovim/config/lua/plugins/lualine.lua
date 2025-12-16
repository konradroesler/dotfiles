return {
	"nvim-lualine/lualine.nvim",
  config = function()
		require("lualine").setup({
			options = {
				theme = "onedark",
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = { "typst" },
          winbar = { "typst" },
        },
			},
		})
	end,
}
