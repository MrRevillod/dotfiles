return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "folke/neodev.nvim"
    },

    event = 'VimEnter', -- if you want lazy load, see below

    config = function()

        require("neodev").setup()
        require("lspconfig").lua_ls.setup({
            -- on_attach = on_attach,
            settings = {
                Lua = {
                    telemetry = { enable = false },
                    workspace = { checkThirdParty = false },
                }
            }
        })
        require("lspconfig").html.setup({})
        require("lspconfig").jsonls.setup({})
        require("lspconfig").prismals.setup({})
        require("lspconfig").rust_analyzer.setup({})
        require("lspconfig").tailwindcss.setup({})
        require("lspconfig").eslint.setup({})
        require("lspconfig").ts_ls.setup({})
    end
}
