return {

	'nvim-tree/nvim-web-devicons',
	{
		-- lets you see the undo history for the specific file
		'mbbill/undotree',
		event = "BufReadPre",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end
	},
	{
		-- pretty lua line :D
		'nvim-lualine/lualine.nvim',
		config = function()
			require('lualine').setup {}
		end
	},
	{
		'prichrd/netrw.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require 'netrw'.setup {
				-- Put your configuration here, or leave the object empty to take the default
				-- configuration.
				icons = {
					symlink = '', -- Symlink icon (directory and file)
					directory = '', -- Directory icon
					file = '', -- File icon
				},
				use_devicons = true, -- Uses nvim-web-devicons if true, otherwise use the file icon specified above
			}
		end
	}
	-- {
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	config = function()
	-- 		local options = {
	-- 			filters = {
	-- 				dotfiles = false,
	-- 			},
	-- 			disable_netrw = true,
	-- 			hijack_netrw = true,
	-- 			hijack_cursor = true,
	-- 			hijack_unnamed_buffer_when_opening = false,
	-- 			sync_root_with_cwd = true,
	-- 			update_focused_file = {
	-- 				enable = true,
	-- 				update_root = true,
	-- 			},
	-- 		}
	--
	-- 		require("nvim-tree").setup(options)
	--
	--
	-- 		vim.keymap.set("n", "<C-e>", function()
	-- 			require("nvim-tree.api").tree.open()
	-- 		end)
	-- 	end
	-- }
}
