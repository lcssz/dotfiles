return {
	'stevearc/oil.nvim',
	opts = {
		keymaps = {
			["<CR>"] = "actions.select",
			["<C-l>"] = { "actions.select", opts = { vertical = true } },
			["<C-j>"] = { "actions.select", opts = { horizontal = true } },
			["<BS>"] = { "actions.parent", mode = "n" },
		}
	},
	config = function(_,opts)
		require('oil').setup(opts)
	end
}
