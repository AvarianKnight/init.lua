return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			-- harpoon2 doesn't currently have stuff for handling terminals
			local harpoon = require("harpoon")

			harpoon:setup({
				settings = {
					sync_on_ui_close = true,
					save_on_toggle = true,
				}
			})

			vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
			vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

			vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
			vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
			vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
			vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
			vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
		end,
	},
	{
		'davvid/harpoon-term.nvim',
		config = function()
			for i = 1, 5 do
				vim.keymap.set({ 'n', 'v' }, '<leader>t' .. i, function()
					require('harpoon_term').goto_terminal(i)
				end)
			end
		end
	}

}
