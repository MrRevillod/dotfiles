vim.g.netrw_banner = 0

vim.api.nvim_create_autocmd("filetype", {
    pattern = "netrw",
    desc = "Better mappings for netrw",
    callback = function()
        local bind = function(lhs, rhs)
            vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
        end

        bind("r", "R")  -- rename
        bind("a", "%")  -- create new file
        bind("aa", "d") -- create new directory
        bind("dd", "D") -- delete file or directory
    end
})

--vim.api.nvim_set_keymap("n", "<A-e>", "", {
--    noremap = true,
--    silent = true,
--    callback = require("config.utils").toggle_netrw
--})
