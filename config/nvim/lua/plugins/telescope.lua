return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
            "nvim-telescope/telescope-file-browser.nvim",
        },
        config = function()

            local utils = require("config.utils")

            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            -- Abrir archivo en nueva pestaña por defecto
                            ["<CR>"] = function(prompt_bufnr)
                                local action_state = require("telescope.actions.state")
                                local entry = action_state.get_selected_entry()
                                require("telescope.actions").close(prompt_bufnr)
                                if vim.fn.isdirectory(entry.value) == 1 then
                                    require("telescope").extensions.file_browser.file_browser({
                                        path = entry.value,
                                        initial_mode = "normal",
                                    })
                                else
                                    vim.cmd("tabnew " .. entry.value)  -- Abrir en nueva pestaña
                                end
                            end,
                            -- Abrir archivo en la ventana actual con <C-v>
                            ["<C-v>"] = function(prompt_bufnr)
                                local action_state = require("telescope.actions.state")
                                local entry = action_state.get_selected_entry()
                                require("telescope.actions").close(prompt_bufnr)
                                vim.cmd("edit " .. entry.value)  -- Abrir en la ventana actual
                            end,
                        },
                        n = {
                            -- Abrir archivo en nueva pestaña por defecto
                            ["<CR>"] = function(prompt_bufnr)
                                local action_state = require("telescope.actions.state")
                                local entry = action_state.get_selected_entry()
                                require("telescope.actions").close(prompt_bufnr)

                                if vim.fn.isdirectory(entry.value) == 1 then
                                    require("telescope").extensions.file_browser.file_browser({
                                        path = entry.value,
                                        initial_mode = "normal",
                                    })
                                else
                                    vim.cmd("tabnew " .. entry.value)  -- Abrir en nueva pestaña
                                end
                            end,
                            -- Abrir archivo en la ventana actual con <C-v>
                            ["<C-v>"] = function(prompt_bufnr)
                                local action_state = require("telescope.actions.state")
                                local entry = action_state.get_selected_entry()
                                require("telescope.actions").close(prompt_bufnr)
                                vim.cmd("edit " .. entry.value)  -- Abrir en la ventana actual
                            end,
                        },
                    },
                    file_ignore_patterns = {
                        "node_modules",
                        "target",
                        ".git"
                    }
                },
                extensions = {
                    colorscheme = {
                        enable_preview = true,
                        on_select = function(theme)
                            vim.cmd("colorscheme " .. theme)
                            utils.save_theme(theme)
                        end,
                    },

                    file_browser = {
                        theme = "dropdown",
                        hijack_netrw = true,  -- Usar telescope-file-browser en lugar de netrw
                        grouped = true,      -- Desactivar la agrupación por tipo de archivo
                        respect_gitignore = false,  -- Respetar archivos ignorados por git
                        hidden = true,        -- Mostrar archivos ocultos
                        initial_mode = "normal",  -- Modo inicial (normal o insert)
                        sorting_strategy = "ascending",  -- Orden ascendente
                        dir_icon = "",  -- Ícono para directorios
                        file_icon = "",  -- Ícono para archivos
                        previewer = false,
                        mappings = {
                            ["i"] = {
                                ["<C-n>"] = require("telescope._extensions.file_browser.actions").create,
                                ["<C-r>"] = require("telescope._extensions.file_browser.actions").rename,
                                ["<C-d>"] = require("telescope._extensions.file_browser.actions").remove,
                            },
                            ["n"] = {
                                n = require("telescope._extensions.file_browser.actions").create,
                                r = require("telescope._extensions.file_browser.actions").rename,
                                d = require("telescope._extensions.file_browser.actions").remove,
                            },
                        },
                    },
                },
            })

            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "file_browser")

            local map = require("config.utils").map
            map("n", "<leader>fr", require("telescope.builtin").oldfiles, "Recently opened")
            map("n", "<leader><space>", require("telescope.builtin").find_files, "Files")
            map("n", "<C-p>", require("telescope.builtin").keymaps, "Search keymaps")
            map("n", "<A-e>", function()
                require("telescope").extensions.file_browser.file_browser({
                    initial_mode = "normal",
                    path = vim.fn.expand("%:p:h"),
                    -- mappings = {
                    --     i = {
                    --         -- Abrir archivo en nueva pestaña con <C-t>
                    --         ["<C-t>"] = function(prompt_bufnr)
                    --             local action_state = require("telescope.actions.state")
                    --             local entry = action_state.get_selected_entry()
                    --             require("telescope.actions").close(prompt_bufnr)
                    --             vim.cmd("tabnew " .. entry.value)
                    --         end,
                    --     },
                    --     n = {
                    --         -- Abrir archivo en nueva pestaña con <C-t>
                    --         ["<C-t>"] = function(prompt_bufnr)
                    --             local action_state = require("telescope.actions.state")
                    --             local entry = action_state.get_selected_entry()
                    --             require("telescope.actions").close(prompt_bufnr)
                    --             vim.cmd("tabnew " .. entry.value)
                    --         end,
                    --     },
                    -- },
                })
            end, "File Browser")


        end,
    },
}
