return {
	{
		'mrcjkb/rustaceanvim',
		version = '^3', -- Recommended
		ft = { 'rust' },
	},
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"williamboman/mason.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"ray-x/lsp_signature.nvim",
			-- shows LSP loading info on the bottom right
			"j-hui/fidget.nvim",
			"Hoffs/omnisharp-extended-lsp.nvim",

			"folke/neodev.nvim",
			-- "OmniSharp/Omnisharp-vim"
		},
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							hint = {
								enable = true
							},
							diagnostics = {
								globals = { "Citizen", "mysql", "vim", "vector3", "vector2", "vec3", "fx_version" },
							},
							completion = {
								autorequire = false
							},
							runtime = {
								version = "lua 5.4",
								plugin = "~/.config/fivem-lls-addon/plugin.lua",
								nonstandardSymbol = {
									"+=",
									"-=",
									"*=",
									"/=",
									"&=",
									"|=",
									"^=",
									"`"
								}
							},
							workspace = {
								library = {
									[vim.fn.expand "$vimruntime/lua"] = true,
									[vim.fn.expand "$vimruntime/lua/vim/lsp"] = true,
									["~/.config/fivem-lls-addon/library"] = true,
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
				},
				tsserver = {
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
								includeInlayParameterNameHintsWhenArgumentMatchesName = true,
								includeInlayVariableTypeHints = true,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHintsWhenTypeMatchesName = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
								includeInlayParameterNameHintsWhenArgumentMatchesName = true,
								includeInlayVariableTypeHints = true,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHintsWhenTypeMatchesName = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
			},
			-- inlay_hints = {
			-- 	enabled = true,
			-- }
		},
		config = function(_, opts)
			local lspconfig = require('lspconfig')
			local lsp_defaults = lspconfig.util.default_config

			require 'lsp_signature'.setup();

			require("neodev").setup()

			lsp_defaults.capabilities = vim.tbl_deep_extend(
				'force',
				lsp_defaults.capabilities,
				require('cmp_nvim_lsp').default_capabilities()
			)

			vim.api.nvim_create_autocmd('LspAttach', {
				desc = 'LSP actions',
				callback = function(event)
					local buff_opts = { buffer = event.buf }

					vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, buff_opts)
					vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, buff_opts)
					vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, buff_opts)
					vim.keymap.set('n', 'gI', function() vim.lsp.buf.implementation() end, buff_opts)
					vim.keymap.set('n', '<leader>td', function() vim.lsp.buf.type_definition() end, buff_opts)

					vim.keymap.set({ 'n', 'i' }, '<C-s>', function() vim.lsp.buf.signature_help() end, buff_opts)

					vim.keymap.set("n", "<leader>rn", function() require("cosmic-ui").rename() end, buff_opts)
					vim.keymap.set({ 'n', 'x' }, "<leader>fb", function() vim.lsp.buf.format({ async = true }) end,
						buff_opts)

					vim.keymap.set("n", "<leader>lf", function() vim.diagnostic.open_float() end, buff_opts)
					vim.keymap.set("n", "<leader>la", "<Cmd> CodeActionMenu <CR>", buff_opts)
					vim.keymap.set("n", 'gD', vim.lsp.buf.declaration)
				end
			})

			vim.keymap.set("n", "<leader>fp", function()
				vim.lsp.buf.format({ async = true })
			end)


			require("fidget").setup {}

			require('mason').setup({})
			require('mason-lspconfig').setup({
				ensure_installed = { "rust_analyzer" },
				handlers = {
					function(server)
						if server == "rust_analyzer" then return end
						lspconfig[server].setup(opts.servers[server] or {})
					end,
					["omnisharp"] = function(server)
						local pid = vim.fn.getpid()

						local omnisharp_bin = "/usr/local/bin/omnisharp/OmniSharp"

						lspconfig["omnisharp"].setup({
							handlers = {
								["textDocument/definition"] = require('omnisharp_extended').handler,
							},
							cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) }
						})
					end,
				},
			})

			local cmp = require('cmp')
			cmp.setup({
				sources = {
					{ name = 'path' },
					{
						name = 'nvim_lsp',
						-- i have no care in the world for snippets half of the
						-- time they're just horrible
						entry_filter = function(entry)
							return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
						end
					},
					{ name = 'buffer', keyword_length = 2 },
				},
				mapping = cmp.mapping.preset.insert({
					['<C-y>'] = cmp.mapping.confirm({ select = true }),
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



			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				update_in_insert = false,
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
	{
		"windwp/nvim-ts-autotag",
		event = "BufReadPre"
	},
	{
		'weilbith/nvim-code-action-menu',
		cmd = 'CodeActionMenu',
	},
}
