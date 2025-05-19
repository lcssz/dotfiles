return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'saghen/blink.cmp',
	},
	opts = {
		servers = {
			clangd = {},
			html = {},
			zls = {},
			hls = {
				cmd = { 'haskell-language-server-wrapper', '--lsp' },
				filetypes = { 'haskell', 'lhaskell', 'cabal' },
			},
			gopls = {},
			pyright = {},
			omnisharp = {
				cmd = { "dotnet", "/home/lcssz/.wine/dosdevices/z:/usr/lib/omnisharp-roslyn/OmniSharp.dll" },
			},
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						}
					}
				}
			},
		}
	},
	config = function(_, opts)
		local lspconfig = require('lspconfig')
		for server, config in pairs(opts.servers) do
			config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end
}
