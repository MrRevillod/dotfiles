local M = {}

M.map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

M.lsp_map = function(lhs, rhs, bufnr, desc)
    vim.keymap.set("n", lhs, rhs, { silent = true, buffer = bufnr, desc = desc })
end

M.dap_map = function(mode, lhs, rhs, desc)
    M.map(mode, lhs, rhs, desc)
end

M.set_leader = function(key)
    vim.g.mapleader = key
    vim.g.maplocalleader = key
    M.map({ "n", "v" }, key, "<nop>")
end

M.toggle_netrw = function()
    local netrwIsOpen = false
    local buffers = vim.api.nvim_list_bufs()

    for _, buf in ipairs(buffers) do
        if vim.bo[buf].filetype == "netrw" then
            netrwIsOpen = true
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end

    if not netrwIsOpen then
        -- Abre netrw
        vim.cmd("Explore")
    end
end

return M
