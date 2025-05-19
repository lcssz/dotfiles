return {
	{
		'echasnovski/mini.ai',
		version = false,
		config = function()
			require('mini.ai').setup()
		end
	},
	{
		'echasnovski/mini.pairs',
		version = false,
		config = function()
			require('mini.pairs').setup();
		end
	},
	{
		'echasnovski/mini.surround',
		version = '*',
		config = function()
			require('mini.surround').setup();
		end
	},
	{
		'echasnovski/mini.jump',
		version = false,
		config = function()
			require('mini.jump').setup();
		end
	},
	{
		'echasnovski/mini.clue',
		version = false,
		config = function()
			require('mini.clue').setup({
				triggers = {
					-- Leader triggers
					{ mode = 'n', keys = '<Leader>' },
					{ mode = 'x', keys = '<Leader>' },

					-- Built-in completion
					{ mode = 'i', keys = '<C-x>' },

					-- `g` key
					{ mode = 'n', keys = 'g' },
					{ mode = 'x', keys = 'g' },

					-- Marks
					{ mode = 'n', keys = "'" },
					{ mode = 'n', keys = '`' },
					{ mode = 'x', keys = "'" },
					{ mode = 'x', keys = '`' },

					-- Registers
					{ mode = 'n', keys = '"' },
					{ mode = 'x', keys = '"' },
					{ mode = 'i', keys = '<C-r>' },
					{ mode = 'c', keys = '<C-r>' },

					-- Window commands
					{ mode = 'n', keys = '<C-w>' },

					-- `z` key
					{ mode = 'n', keys = 'z' },
					{ mode = 'x', keys = 'z' },
				},
				window = {
					delay = 200
				}
			})
		end
	}
}
