return {
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require("Comment").setup({
                -- Opciones de configuración (opcional)
                toggler = {
                    line = "gcc",  -- Comentar/descomentar una línea (modo normal)
                    block = "gbc", -- Comentar/descomentar un bloque (modo visual)
                },
                opleader = {
                    line = "gc",   -- Comentar/descomentar líneas (modo visual)
                    block = "gb",  -- Comentar/descomentar bloques (modo visual)
                },
            })
        end,
    },
}
