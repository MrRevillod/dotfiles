
return {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function ()
        require("onedarkpro").setup({
            colors = {
                dark = { bg = "#151515" }, -- yellow
                light = { bg = "#00FF00" }, -- green
            }
        })
    end
}

