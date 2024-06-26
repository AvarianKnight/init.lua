return {
	'nvim-telescope/telescope-ui-select.nvim',
	{
		'mrcjkb/rustaceanvim',
		version = '^4', -- Recommended
		ft = { 'rust' },
		config = function()
			vim.g.rustaceanvim = {
				-- Plugin configuration
				tools = {
				},
				-- LSP configuration
				server = {
					on_attach = function(client, bufnr)
						-- you can also put keymaps in here
					end,
					default_settings = {
						-- rust-analyzer language server configuration
						['rust-analyzer'] = {
							cargo = {
								buildScripts = {
									rebuildOnSave = false
								}
							}
						},
					},
				},
			}
		end
	},
	-- {
	-- 	"aznhe21/actions-preview.nvim",
	-- 	config = function()
	-- 		vim.keymap.set({ "v", "n" }, "<leader>la", require("actions-preview").code_actions)
	-- 	end,
	-- },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			'nvim-lua/plenary.nvim',
			'filipdutescu/renamer.nvim',
			"williamboman/mason-lspconfig.nvim",
			"williamboman/mason.nvim",
			"pmizio/typescript-tools.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"ray-x/lsp_signature.nvim",
			-- shows LSP loading info on the bottom right
			"j-hui/fidget.nvim",
			"Hoffs/omnisharp-extended-lsp.nvim",

			"folke/neodev.nvim",
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
			},
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


					local client = vim.lsp.get_client_by_id(event.data.client_id);

					-- vim.lsp.inlay_hint.enable(true)
					if client and client.server_capabilities.inlayHintProvider then
						vim.lsp.inlay_hint.enable(true)
					end

					local lsp_definitions = require('telescope.builtin').lsp_definitions
					local lsp_references = require('telescope.builtin').lsp_references
					local lsp_implementations = require('telescope.builtin').lsp_implementations
					local lsp_type_definitions = require('telescope.builtin').lsp_type_definitions

					if client and client.name == "omnisharp" then
						lsp_definitions = "<cmd>lua require('omnisharp_extended').telescope_lsp_definition()<cr>"
						lsp_references = "<cmd>lua require('omnisharp_extended').telescope_lsp_references()<cr>"
						lsp_implementations = "<cmd>require('omnisharp_extended').telescope_lsp_implementation()<cr>"
						lsp_type_definitions = "<cmd>require('omnisharp_extended').telescope_lsp_type_definition()<cr>"
					end

					local map = function(keys, func, desc)
						vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
					end

					-- Opens a popup that displays documentation about the word under your cursor
					--  See `:help K` for why this keymap
					map('K', vim.lsp.buf.hover, 'Hover Documentation')

					-- Jump to the definition of the word under your cursor.
					--  This is where a variable was first declared, or where a function is defined, etc.
					--  To jump back, press <C-t>.
					map('gd', lsp_definitions, '[G]oto [D]efinition')

					-- Find references for the word under your cursor.
					map('gr', lsp_references, '[G]oto [R]eferences')

					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map('gI', lsp_implementations, '[G]oto [I]mplementation')

					-- WARN: This is not Goto Definition, this is Goto Declaration.
					--  For example, in C this would take you to the header
					map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map('gtd', lsp_type_definitions, 'Type [D]efinition')
					map('<leader>la', vim.lsp.buf.code_action, 'Type [D]efinition')

					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, buff_opts)
					vim.keymap.set({ 'n', 'x' }, "<leader>fb", function() vim.lsp.buf.format({ async = true }) end,
						buff_opts)

					vim.keymap.set("n", "<leader>lf", function() vim.diagnostic.open_float() end, buff_opts)
					-- vim.keymap.set("n", "<leader>la", "<Cmd> CodeActionMenu <CR>", buff_opts)
					vim.keymap.set("n", 'gD', vim.lsp.buf.declaration)
				end
			})

			vim.keymap.set("n", "<leader>fp", function()
				vim.lsp.buf.format({ async = true })
			end)


			require("fidget").setup {}

			-- require("typescript-tools").setup {
			--
			-- }

			require('mason').setup({})
			require('mason-lspconfig').setup({
				ensure_installed = { "rust_analyzer", "lua_ls" },
				handlers = {
					function(server)
						if server == "rust_analyzer" then return end
						-- if server == "tsserver" then return end
						lspconfig[server].setup(opts.servers[server] or {})
					end,
					["omnisharp"] = function(server)
						lspconfig["omnisharp"].setup({
							handlers = vim.tbl_deep_extend("force", {
								["textDocument/definition"] = require('omnisharp_extended').definition_handler,
								["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
								["textDocument/references"] = require('omnisharp_extended').references_handler,
								["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
							}, vim.lsp.handlers),
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
	{
		"windwp/nvim-ts-autotag",
		event = "BufReadPre"
	},
}
