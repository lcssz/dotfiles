return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	opts = {
		theme = 'fluoromachine'
	},
	config = function(_, opts)
		require('lualine').setup(opts)
	end
}
