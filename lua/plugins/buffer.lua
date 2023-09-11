-- this contains anything that will modify the buffer (besides the lsp)
return {
	{
		-- this shows the indention for the current context (statement? idk)
		-- its the bars that show the current indention level
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		setup = function()
			require("indent_blankline").setup {
				show_current_context = true,
				show_current_context_start = true,
			}
		end
	},
	{
		-- used for persistence sessions
		"folke/persistence.nvim",
		opts = {
			dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
			options = { "buffers", "curdir", "tabpages", "winsize" },
		},
		keys = {
			{
				"<leader>qs",
				function()
					require("persistence").load()
				end,
				desc = "Load the last session for this directory"
			}
		},
	},
	{
		-- adds highlighting todo comments and other things
		"folke/todo-comments.nvim",
		event = "BufReadPre",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {}
	},

	{
		-- better renaming
		'CosmicNvim/cosmic-ui',
		event = "BufReadPre",
		dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
		config = function()
			require('cosmic-ui').setup()
		end
	},

	{
		-- adds color to hex colors, rgba, etc.
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			require 'colorizer'.setup()
		end
	},
	{
		-- adds colors for tailwindcss
		"roobert/tailwindcss-colorizer-cmp.nvim",
		event = "BufReadPre"
	},
	{
		-- adds documentation comments
		"danymat/neogen",
		event = "BufReadPre",
		keys = {
			{
				"<leader>cc",
				function()
					require("neogen").generate({})
				end,
				desc = "Neogen Comment",
			},
		},
		opts = { snippet_engine = "luasnip" },
	},
	{
		-- TODO: replace with mini.nvim?
		"windwp/nvim-autopairs",
		event = "BufReadPre",
		config = function()
			require('nvim-autopairs').setup()
		end,
	},
	{
		-- lets you do easy comments
		'numToStr/Comment.nvim',
		event = "BufReadPre",
		config = function()
			require('Comment').setup({
				mappings = {},
			})

			vim.keymap.set("n", "<leader>/", function()
				require("Comment.api").toggle.linewise.current()
			end)

			vim.keymap.set("v", "<leader>/",
			     "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
		end
	}
}
