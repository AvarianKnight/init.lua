return {
	{
		-- lets you see the undo history for the specific file
		'mbbill/undotree',
		event = "BufReadPre",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end
	},
	-- git plugin for using git inside of neovim
	'tpope/vim-fugitive',
	{
		-- pretty lua line :D
		'nvim-lualine/lualine.nvim',
		config = function()
			require('lualine').setup {}
		end
	},
	'prichrd/netrw.nvim',
}
