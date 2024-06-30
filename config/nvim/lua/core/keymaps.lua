local map = require("utils.keys").map
local toggle_netrw = require("utils.keys").toggle_netrw

local custom_map = vim.api.nvim_set_keymap

-- Normal --
-- move text up and down
map("n", "<a-k>", ":m .-2<cr>==", "Move line up")
map("n", "<a-j>", ":m .+1<cr>==", "Move line down")

-- Save file ---
map("n", "<C-s>", ":<c-u>update<cr>", "Save file")

-- Mapeo para alternar netrw --
custom_map("n", "<A-e>", "", {
    noremap = true,
    silent = true,
    callback = toggle_netrw,
})

-- insert --
-- press jk fast to exit insert mode
map("i", "jk", "<esc>", "Insert mode")
map("i", "kj", "<esc>", "Insert mode")

-- visual --
-- stay in indent mode
map("v", "<", "<gv", "Right indentation")
map("v", ">", ">gv", "Left indentation")
