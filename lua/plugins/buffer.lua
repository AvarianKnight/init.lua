-- this contains anything that will modify the buffer (besides the lsp)
return {
	{
		"tpope/vim-sleuth"
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
