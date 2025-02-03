local M = {}

local function setup_globals()
	vim.g.mapleader = " "
	vim.g.maplocalleader = "\\"
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
end

local function setup_options()
	vim.opt.autoindent = true
	vim.opt.ignorecase = true
	vim.opt.smartcase = true
	vim.opt.smartindent = true
	vim.opt.number = true
	vim.opt.relativenumber = true
	vim.opt.shiftwidth = 2
	vim.opt.tabstop = 2
	vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
end

function M.setup()
	setup_globals()
	setup_options()
end

return M
