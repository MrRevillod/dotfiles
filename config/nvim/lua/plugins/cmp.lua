return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        event = "VeryLazy",
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            require("luasnip/loaders/from_vscode").lazy_load()

            local kind_icons = {
                Text = " ",          -- Texto
                Method = " ",        -- Método
                Function = " ",      -- Función
                Constructor = " ",   -- Constructor
                Field = " ",         -- Campo
                Variable = " ",      -- Variable
                Class = " ",         -- Clase
                Interface = " ",     -- Interfaz
                Module = " ",        -- Módulo
                Property = " ",      -- Propiedad
                Unit = " ",          -- Unidad
                Value = " ",         -- Valor
                Enum = " ",          -- Enumeración
                Keyword = " ",       -- Palabra clave
                Snippet = " ",       -- Snippet
                Color = " ",         -- Color
                File = " ",          -- Archivo
                Reference = " ",     -- Referencia
                Folder = " ",        -- Carpeta
                EnumMember = " ",    -- Miembro de enumeración
                Constant = " ",      -- Constante
                Struct = " ",        -- Estructura
                Event = " ",         -- Evento
                Operator = " ",      -- Operador
                TypeParameter = " ", -- Parámetro de tipo
            }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<S-k>"] = cmp.mapping.select_prev_item(),
                    ["<S-j>"] = cmp.mapping.select_next_item(),
                    ["<S-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<S-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),  -- Activar autocompletado manualmente
                    ["<Enter>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    }),
                    -- ["<Tab>"] = cmp.mapping(function(fallback)
                    --     if cmp.visible() then
                    --         cmp.select_next_item()
                    --     elseif luasnip.expand_or_jumpable() then
                    --         luasnip.expand_or_jump()
                    --     else
                    --         fallback()
                    --     end
                    -- end, { "i", "s" }),
                    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
                    --     if cmp.visible() then
                    --         cmp.select_prev_item()
                    --     elseif luasnip.jumpable(-1) then
                    --         luasnip.jump(-1)
                    --     else
                    --         fallback()
                    --     end
                    -- end, { "i", "s" }),
                }),
                formatting = {
                    fields = { "abbr", "kind" },  -- Campos a mostrar (sin "menu")
                    format = function(entry, item)
                        -- Añadir el ícono correspondiente al tipo (kind) al final
                        item.kind = string.format("%s", kind_icons[item.kind] or " ")

                        -- Acortar el texto si es demasiado largo
                        local ELLIPSIS_CHAR = '…'
                        local MAX_LABEL_WIDTH = 25

                        if #item.abbr > MAX_LABEL_WIDTH then
                            item.abbr = vim.fn.strcharpart(item.abbr, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
                        end

                        -- Añadir el nombre de la fuente (opcional)
                        item.menu = ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        })[entry.source.name] or ""

                        item = require("tailwindcss-colorizer-cmp").formatter(entry, item)

                        return item
                    end,
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
                window = {
                    completion = {
                        scrollbar = false,
                    },
                },
            })
        end,
    },
}


-- return {
--     {
--         "hrsh7th/nvim-cmp",
--         dependencies = {
--             "hrsh7th/cmp-nvim-lsp",
--             "hrsh7th/cmp-nvim-lua",
--             "hrsh7th/cmp-buffer",
--             "hrsh7th/cmp-path",
--             "L3MON4D3/LuaSnip",
--             "saadparwaiz1/cmp_luasnip",
--             "rafamadriz/friendly-snippets",
--         },
--         event = "VeryLazy",
--         config = function()
--             local cmp = require("cmp")
--             local luasnip = require("luasnip")
--
--             require("luasnip/loaders/from_vscode").lazy_load()
--
--             local kind_icons = {
--                 Text = " ",
--                 Method = "m ",
--                 Function = " ",
--                 Constructor = " ",
--                 Field = " ",
--                 Variable = " ",
--                 Class = " ",
--                 Interface = " ",
--                 Module = " ",
--                 Property = " ",
--                 Unit = " ",
--                 Value = " ",
--                 Enum = " ",
--                 Keyword = " ",
--                 Snippet = " ",
--                 Color = " ",
--                 File = " ",
--                 Reference = " ",
--                 Folder = " ",
--                 EnumMember = " ",
--                 Constant = " ",
--                 Struct = " ",
--                 Event = " ",
--                 Operator = " ",
--                 TypeParameter = " ",
--             }
--
--             cmp.setup({
--                 snippet = {
--                     expand = function(args)
--                         luasnip.lsp_expand(args.body)
--                     end,
--                 },
--                 mapping = cmp.mapping.preset.insert({
--                     ["<C-k>"] = cmp.mapping.select_prev_item(),
--                     ["<C-j>"] = cmp.mapping.select_next_item(),
--                     ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--                     ["<C-f>"] = cmp.mapping.scroll_docs(4),
--                     ["<C-Space>"] = cmp.mapping.complete(),  -- Activar autocompletado manualmente
--                     ["<Enter>"] = cmp.mapping.confirm({
--                         behavior = cmp.ConfirmBehavior.Replace,
--                         select = false,
--                     }),
--                     ["<Tab>"] = cmp.mapping(function(fallback)
--                         if cmp.visible() then
--                             cmp.select_next_item()
--                         elseif luasnip.expand_or_jumpable() then
--                             luasnip.expand_or_jump()
--                         else
--                             fallback()
--                         end
--                     end, { "i", "s" }),
--                     ["<S-Tab>"] = cmp.mapping(function(fallback)
--                         if cmp.visible() then
--                             cmp.select_prev_item()
--                         elseif luasnip.jumpable(-1) then
--                             luasnip.jump(-1)
--                         else
--                             fallback()
--                         end
--                     end, { "i", "s" }),
--                 }),
--                 completion = {
--                     autocomplete = false,  -- Desactiva el autocompletado automático
--                 },
--                 formatting = {
--                     format = function(_, item)
--                         local ELLIPSIS_CHAR = '…'
--                         local MAX_LABEL_WIDTH = 25
--
--                         local get_ws = function (max, len)
--                           return (" "):rep(max - len)
--                         end
--
--                         local content = item.abbr
--
--                         if #content > MAX_LABEL_WIDTH then
--                             item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
--                         else
--                             item.abbr = content .. get_ws(MAX_LABEL_WIDTH, #content)
--                         end
--
--                         item = require("tailwindcss-colorizer-cmp").formatter(_, item)
--
--                         return item
--                     end,
--                 },
--                 sources = {
--                     { name = "nvim_lsp" },
--                     { name = "luasnip" },
--                     { name = "buffer" },
--                     { name = "path" },
--                 },
--                 window = {
--                     completion = {
--                         scrollbar = false,
--                     },
--                 },
--             })
--         end,
--     },
-- }
