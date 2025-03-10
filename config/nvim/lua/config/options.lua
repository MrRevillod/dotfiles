local opts = {

    shiftwidth = 4,
    tabstop = 4,
    expandtab = true,
    wrap = false,
    number = true,
    numberwidth = 2,
    autoindent = true,
    smartindent = true,
    copyindent = true,
    relativenumber = true,
    clipboard = "unnamedplus",
    laststatus = 0,
    showmode = false,
    cmdheight = 0,
    signcolumn = "yes",
    startofline = false
}

for option, val in pairs(opts) do
    vim.opt[option] = val
end

vim.g.netrw_liststyle = 3
