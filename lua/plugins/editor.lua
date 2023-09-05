return {
	{
		'mbbill/undotree',
		event = "BufReadPre",
	},
	'tpope/vim-fugitive',
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		setup = function()
			require("indent_blankline").setup {
				-- for example, context is off by default, use this to turn it on
				show_current_context = true,
				show_current_context_start = true,
			}
		end
	},
	{
		'nvim-telescope/telescope.nvim',
		-- version = '0.1.x',
		dependencies = { { 'nvim-lua/plenary.nvim' } },
		config = function()
			require("telescope").setup {
				defaults = {
					file_ignore_patterns = {
						"node_modules",
						".git/",
						"dist/*",
						"html/*",
					}
				}
			}
		end
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",                                    -- this will only start session saving when an actual file was opened
		opts = {
			dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
			options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
		}
	},
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			icons = {
				buffer_index = true,
			}
		},
		version = '^1.0.0',
	},
	{
		'nvim-lualine/lualine.nvim',
		config = function()
			require('lualine').setup {}
		end
	},
	{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	},
	{
		"folke/todo-comments.nvim",
		event = "BufReadPre",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {}
	},
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		event = "BufReadPre",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			on_attach = function(bufnr)
				vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
					{ buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
				vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk,
					{ buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
				vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk,
					{ buffer = bufnr, desc = '[P]review [H]unk' })
			end,
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			modes = {
				char = {
					jump_labels = true,
					label = { exclude = "dD" },
				},
			},
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{ 'CosmicNvim/cosmic-ui',
		dependencies = {'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim'},
		config = function()
			require('cosmic-ui').setup()
		end
	},
	{ "NvChad/nvim-colorizer.lua",
		config = function()
			require 'colorizer'.setup()
		end
	},
	{ "wakatime/vim-wakatime",                  event = "BufReadPre" },
	{ 'echasnovski/mini.nvim',                  version = '*' },
	{ "roobert/tailwindcss-colorizer-cmp.nvim", event = "BufReadPre" },
	"tpope/vim-sleuth",
	"nvim-treesitter/nvim-treesitter-context",
	'prichrd/netrw.nvim',
}
