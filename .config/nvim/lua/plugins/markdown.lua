return {
	'MeanderingProgrammer/render-markdown.nvim',
	dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
	opts = {},
	config = function()
		require('render-markdown').setup({})
	end
}
