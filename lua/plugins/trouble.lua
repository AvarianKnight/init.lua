return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		vim.keymap.set("n", "<leader>to", function() require("trouble").toggle() end)
		vim.keymap.set("n", "<leader>]d", function() require("trouble").prev({ skip_groups = true, jump = true }) end)
		vim.keymap.set("n", "<leader>[d", function() require("trouble").next({ skip_groups = true, jump = true }) end)
		vim.keymap.set("n", "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end)
		vim.keymap.set("n", "<leader>td", function() require("trouble").toggle("document_diagnostics") end)
		vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end)
		vim.keymap.set("n", "<leader>tl", function() require("trouble").toggle("loclist") end)
		vim.keymap.set("n", "gr", function() require("trouble").toggle("lsp_references") end)
	end
}
