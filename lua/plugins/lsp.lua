return {
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"ray-x/lsp_signature.nvim",
			"L3MON4D3/LuaSnip"
		},
		config = function()
			local lspconfig = require('lspconfig')
			local lsp_defaults = lspconfig.util.default_config

			lsp_defaults.capabilities = vim.tbl_deep_extend(
				'force',
				lsp_defaults.capabilities,
				require('cmp_nvim_lsp').default_capabilities()
			)

			local lsp_signature = require("lsp_signature")
			lsp_signature.setup({})
			lsp_signature.on_attach({
				doc_lines = 5,
			})

			vim.api.nvim_create_autocmd('LspAttach', {
				desc = 'LSP actions',
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
					vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
					vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
					vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
					vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, opts)
					vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
					vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help() end, opts)
					vim.keymap.set("n", "gn", function() require("cosmic-ui").rename() end, opts)
					vim.keymap.set({ 'n', 'x' }, "<leader>fp", function() vim.lsp.buf.format({ async = true }) end, opts)
					vim.keymap.set("n", "ga", "<Cmd> CodeActionMenu <CR>", opts)

					vim.keymap.set('n', 'gf', function() vim.diagnostic.open_float() end, opts)
					vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
					vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)


					vim.keymap.set("n", "<leader>cs", function() vim.lsp.buf.workspace_symbol() end, opts)
					vim.keymap.set("n", "<leader>cf", function() vim.diagnostic.open_float() end, opts)
					vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
					vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
					vim.keymap.set("n", "<leader>ca", "<Cmd> CodeActionMenu <CR>", opts)
					vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.references() end, opts)
					vim.keymap.set("n", "<leader>ci", function() vim.lsp.buf.signature_help() end, opts)
				end
			})

			vim.keymap.set("n", "<leader>fp", function()
				vim.lsp.buf.format({ async = true })
			end)

			local default_setup = function(server)
				lspconfig[server].setup({})
			end

			require('mason').setup({})
			require('mason-lspconfig').setup({

				ensure_installed = {},
				handlers = { default_setup },
			})


			local cmp = require('cmp')

			cmp.setup({
				sources = {
					{ name = 'path' },
					{ name = 'nvim_lsp', max_item_count = 30 },
					{ name = 'buffer',   keyword_length = 2, max_item_count = 30 },
					-- { name = 'luasnip',  keyword_length = 2, max_item_count = 30 },
				},
				mapping = cmp.mapping.preset.insert({
					-- Enter key confirms completion item
					['<CR>'] = cmp.mapping.confirm({ select = false }),
					-- Ctrl + space triggers completion menu
					['<C-Space>'] = cmp.mapping.complete(),
				}),
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
			})


			require('lspconfig').lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "Citizen", "mysql", "vim", "vector3", "vector2", "vec3", "fx_version" },
						},
						completion = {
							autorequire = false
						},
						runtime = {
							version = "lua 5.4",
							plugin = "~/.config/lua/plugin.lua",
							nonstandardSymbol = {
								"+=",
								"-=",
								"*=",
								"/=",
								"`"
							}
						},
						workspace = {
							library = {
								[vim.fn.expand "$vimruntime/lua"] = true,
								[vim.fn.expand "$vimruntime/lua/vim/lsp"] = true,
								["~/.config/lua/natives"] = true,
								["~/fxserver/server-data/resources/pma-framework"] = true,
								["~/fxserver/server-data/resources/oxmysql"] = true,
								["~/fxserver/server/alpine/opt/cfx-server/citizen/scripting/lua"] = true,
							},
							type = {
								weakUnionCheck = true,
								weakNilCheck = true,
							},
							maxPreload = 100000,
							preloadfilesize = 10000,
						},
					},
				},
			})

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = false,
					style = 'minimal',
					border = 'rounded',
					source = 'always',
					header = '',
					prefix = '',
				},
			})
		end
	},
	-- adds better autocompletion for vim related things
	{ "folke/neodev.nvim", opts = {} },
	{
		"windwp/nvim-ts-autotag",
		event = "BufReadPre"
	},
	{
		'weilbith/nvim-code-action-menu',
		cmd = 'CodeActionMenu',
	},
}
