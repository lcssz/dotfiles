local M = {}
local builtin = require('telescope.builtin')

-- Helper function for setting keymaps
local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Insert mode navigation mappings
local function setup_insert_mode_navigation()
	map("i", "<C-b>", "<ESC>^i", { desc = "Move beginning of line" })
	map("i", "<C-e>", "<End>", { desc = "Move end of line" })
	map("i", "<C-h>", "<Left>", { desc = "Move left" })
	map("i", "<C-l>", "<Right>", { desc = "Move right" })
	map("i", "<C-j>", "<Down>", { desc = "Move down" })
	map("i", "<C-k>", "<Up>", { desc = "Move up" })
end

-- General normal mode mappings
local function setup_normal_mode_basics()
	map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General clear highlights" })
	map("n", ";", ":", { desc = "Open command mode" })
	map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end

-- Telescope related mappings
local function setup_telescope_mappings()
	map('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
	map('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
	map('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
	map('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
	map('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
	map('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
	map('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
	map('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
	map('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
	map('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
end

-- LSP related mappings
function M.setup_lsp_keymaps(buf)
	map('n', 'gd', vim.lsp.buf.definition, { buffer = buf, desc = '[G]oto [D]efinition' })
	map('n', 'gr', vim.lsp.buf.references, { buffer = buf, desc = '[G]oto [R]eferences' })
	map('n', 'gi', vim.lsp.buf.implementation, { buffer = buf, desc = '[G]oto [I]mplementation' })
	map('n', '<leader>rn', vim.lsp.buf.rename, { buffer = buf, desc = '[R]e[n]ame symbol' })
	map('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = buf, desc = '[C]ode [A]ction' })
	map('n', '<leader>ff', function() vim.lsp.buf.format { async = true } end, { buffer = buf, desc = '[F]ormat [F]ile' })
	map('n', 'K', vim.lsp.buf.hover, { buffer = buf, desc = 'Show hover information' })
	map('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = buf, desc = 'Show signature help' })
	map('n', '<leader>ds', vim.lsp.buf.document_symbol, { buffer = buf, desc = '[D]ocument [S]ymbols' })
	map('n', '<leader>ws', vim.lsp.buf.workspace_symbol, { buffer = buf, desc = '[W]orkspace [S]ymbols' })
	map('n', '<leader>sd', vim.diagnostic.open_float, { buffer = buf, desc = 'Show diagnostics' })
	map('n', '[d', vim.diagnostic.goto_prev, { buffer = buf, desc = 'Previous diagnostic' })
	map('n', ']d', vim.diagnostic.goto_next, { buffer = buf, desc = 'Next diagnostic' })
	map('n', '<leader>q', vim.diagnostic.setloclist, { buffer = buf, desc = 'Diagnostics quickfix list' })
end

-- Initialize all non-LSP keymaps
function M.setup()
	setup_insert_mode_navigation()
	setup_normal_mode_basics()
	setup_telescope_mappings()
end

return M
