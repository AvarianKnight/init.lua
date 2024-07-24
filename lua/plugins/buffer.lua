-- this contains anything that will modify the buffer (besides the lsp)
return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
			{ "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
			{ "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
			{ "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
			{ "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
		},
	},
	{
		"tpope/vim-sleuth"
	},
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		-- adds highlighting todo comments and other things
		"folke/todo-comments.nvim",
		event = "BufReadPre",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {}
	},

	{
		-- adds color to hex colors, rgba, etc.
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			require 'colorizer'.setup({
				filetypes = { "html", "css", "svelte", "react" }
			})
		end
	},
	{
		-- adds colors for tailwindcss
		"roobert/tailwindcss-colorizer-cmp.nvim",
		event = "BufReadPre"
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
	},
}
