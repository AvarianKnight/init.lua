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
		'stevearc/oil.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup()

			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
			vim.keymap.set("n", "<leader>n", function()
				require("oil").toggle_float()
			end, { desc = "Toggles the floating terminal" })
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
