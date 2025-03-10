return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local lualine_theme = theme == "default" and "auto" or colorscheme
        require("lualine").setup({
            options = {
                icons_enabled = "auto",
                theme = lualine_theme,
                component_separators = "|",
                section_separators = "",
                disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
            },
        })
    end,
}
