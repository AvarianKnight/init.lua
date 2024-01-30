return {
	"ThePrimeagen/harpoon",
	-- branch = "harpoon2",
	config = function()
		-- harpoon2 doesn't currently have stuff for handling terminals
		-- local harpoon = require("harpoon")
		-- vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
		-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
		--
		-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
		-- vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
		-- vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
		-- vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
		--
		-- -- Toggle previous & next buffers stored within Harpoon list
		-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
		-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		local term = require("harpoon.term")

		vim.keymap.set("n", "<leader>a", mark.add_file)
		vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

		vim.keymap.set("n", "<leader>t1", function() term.gotoTerminal(1) end)
		vim.keymap.set("n", "<leader>t2", function() term.gotoTerminal(2) end)

		vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
		vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
		vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
		vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)
		vim.keymap.set("n", "<C-;>", function() ui.nav_file(5) end)
	end
}
