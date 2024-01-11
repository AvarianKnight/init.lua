return {
	{
		-- adds documentation comments
		"danymat/neogen",
		event = "BufReadPre",
		keys = {
			{
				"<leader>ca",
				function()
					require("neogen").generate()
				end,
				desc = "Neogen Auto Comment",
			},
			{
				"<leader>cf",
				function()
					require("neogen").generate({ type = "func" })
				end,
				desc = "Neogen Function Comment",
			},
			{
				"<leader>cc",
				function()
					require("neogen").generate({ type = "class" })
				end,
				desc = "Neogen Class Comment",
			},
			{
				"<leader>ct",
				function()
					require("neogen").generate({ type = "type" })
				end,
				desc = "Neogen Type Comment",
			},

		},
		opts = { snippet_engine = "luasnip" },
	},
}
