return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		vim.keymap.set("n", "<leader>lo", function() require("trouble").toggle() end)
		vim.keymap.set("n", "<leader>]d", function() require("trouble").prev({ skip_groups = true, jump = true }) end)
		vim.keymap.set("n", "<leader>[d", function() require("trouble").next({ skip_groups = true, jump = true }) end)
		vim.keymap.set("n", "<leader>lw", function() require("trouble").toggle("workspace_diagnostics") end)
		vim.keymap.set("n", "<leader>lid", function() require("trouble").toggle("document_diagnostics") end)
		vim.keymap.set("n", "<leader>lq", function() require("trouble").toggle("quickfix") end)
		vim.keymap.set("n", "<leader>ll", function() require("trouble").toggle("loclist") end)
		vim.keymap.set("n", "lr", function() require("trouble").toggle("lsp_references") end)
	end
}
