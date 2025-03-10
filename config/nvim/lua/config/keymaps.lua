local map = require("config.utils").map

-- Normal --
-- move text up and down
map("n", "<a-k>", ":m .-2<cr>==", "Move line up")
map("n", "<a-j>", ":m .+1<cr>==", "Move line down")

-- Tabby nvim --
map("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
map("n", "<A-w>", ":tabclose<CR>", { desc = "Close tab" })
map("n", "<S-l>", ":tabnext<CR>", { desc = "Next tab" })
map("n", "<S-h>", ":tabprevious<CR>", { desc = "Previous tab" })

-- Save file ---
map("n", "<C-s>", ":<c-u>update<cr>", "Save file")

-- Go to definition (LSP) --
-- map("n", "gd", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition in new tab" })
map("n", "gd", "<cmd>tab split | Telescope lsp_definitions<CR>", { desc = "Go to definition in new tab" })
map("n", "K", ":lua vim.lsp.buf.hover()<CR>")

-- visual --
-- stay in indent mode
map("v", "<", "<gv", "Right indentation")
map("v", ">", ">gv", "Left indentation")

-- Mover líneas seleccionadas hacia arriba y abajo
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move selection down")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move selection up")
