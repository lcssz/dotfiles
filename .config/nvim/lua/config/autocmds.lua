local M = {}

-- Helper function to create autocommand groups
local function augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Sets up autocommand for LSP keymaps loading
local function setup_lsp_attach()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = augroup("UserLspConfig"),
		callback = function(ev)
			require("config.keymaps").setup_lsp_keymaps(ev.buf)
		end,
	})
end

-- Sets up automatic formatting on file save
local function setup_format_on_save()
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup("FormatOnLoad"),
		callback = function()
			vim.lsp.buf.format({ async = false })
		end,
	})
end

-- Sets up highlight effect when yanking text
local function setup_highlight_on_yank()
	vim.api.nvim_create_autocmd("TextYankPost", {
		group = augroup("HighlightOnYank"),
		callback = function()
			(vim.hl or vim.highlight).on_yank()
		end,
	})
end

-- Sets up indentation for haskell files
local function setup_haskell_config()
	vim.api.nvim_create_autocmd("FileType", {
		group = augroup("HaskellConfig"),
		pattern = "haskell",
		callback = function(opts)
			local buf = opts.buf
			-- Indentation
			vim.bo[buf].expandtab = true
		end
	})
end
function M.setup()
	setup_lsp_attach()
	setup_format_on_save()
	setup_highlight_on_yank()
	setup_haskell_config()
end

return M
