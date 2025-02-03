return {
	{
		"eldritch-theme/eldritch.nvim",
		name = "eldritch",
		opts = {
			palette = "darker"
		},
		config = function(_, opts)
			require('eldritch').setup(opts)
		end,
		priority = 1000,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end
	}
}
