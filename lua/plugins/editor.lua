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
	-- {
	-- 	-- pretty lua line :D
	-- 	'nvim-lualine/lualine.nvim',
	-- 	config = function()
	-- 		require('lualine').setup {}
	-- 	end
	-- },
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
	},
	{
		'nvim-pack/nvim-spectre',
		config = function()
			vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").toggle()<CR>', {
				desc = "Toggle Spectre"
			})
		end
	},
	{
		'stevearc/dressing.nvim',
		opts = {},
	},
	{
		'stevearc/profile.nvim',
		init = function()
			local should_profile = os.getenv("NVIM_PROFILE")
			if should_profile then
				require("profile").instrument_autocmds()
				if should_profile:lower():match("^start") then
					require("profile").start("*")
				else
					require("profile").instrument("*")
				end
			end

			local function toggle_profile()
				local prof = require("profile")
				if prof.is_recording() then
					prof.stop()
					vim.ui.input({ prompt = "Save profile to:", completion = "file", default = "profile.json" },
						function(filename)
							if filename then
								prof.export(filename)
								vim.notify(string.format("Wrote %s", filename))
							end
						end)
				else
					prof.start("*")
				end
			end
			vim.keymap.set("", "<f1>", toggle_profile)
		end
	}
}
