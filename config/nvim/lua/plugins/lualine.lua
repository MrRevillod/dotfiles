return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local colorscheme = require("utils.colorscheme")
		local lualine_theme = colorscheme == "default" and "auto" or colorscheme
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = lualine_theme,
				component_separators = "|",
				section_separators = "",
				disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
			},
		})
	end,
}
