local opts = {
	shiftwidth = 4,
	tabstop = 4,
	expandtab = true,
	wrap = false,
	number = true,
	autoindent = true,
	relativenumber = true,
	clipboard = "unnamedplus",
	laststatus = 0,
	showmode = false,
	cmdheight = 0,
	signcolumn = "no",
}

vim.g.netrw_liststyle = 3

for option, val in pairs(opts) do
	vim.opt[option] = val
end

local colorscheme = require("utils.colorscheme")
vim.cmd.colorscheme(colorscheme)
