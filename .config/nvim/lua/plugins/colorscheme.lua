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
			require("rose-pine").setup({
				variant = "moon",
				dark_variant = "moon",
				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				styles = {
					bold = true,
					italic = true,
					transparency = true,
				},
				highlight_groups = {
					NormalFloat = { bg = "none" },
				},
			})
			-- vim.cmd("colorscheme rose-pine-main")
		end,
	},
	{
		'maxmx03/fluoromachine.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			local fm = require('fluoromachine')
			fm.setup {
				glow = false,
				theme = 'retrowave',
				transparent = true,
			}
			vim.cmd.colorscheme('fluoromachine')
		end
	}
}
