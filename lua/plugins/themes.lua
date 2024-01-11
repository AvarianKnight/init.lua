return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			vim.keymap.set("n", "<leader>cb", function()
				vim.o.background = vim.o.background == "light" and "dark" or "light"
				vim.cmd("hi NonText guifg=bg")
			end)
			vim.o.background = "dark"
			-- vim.cmd('colorscheme gruvbox')
			-- vim.cmd("hi NonText guifg=bg")
		end
	},
	{
		"baliestri/aura-theme",
		lazy = false,
		priority = 1000,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
			-- vim.cmd([[colorscheme aura-dark]])
			vim.cmd("hi NonText guifg=bg")
		end
	},
	{
		"savq/melange-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.opt.termguicolors = true
			-- vim.cmd.colorscheme 'melange'
			vim.cmd("hi NonText guifg=bg")
		end
	},
	{
		"rose-pine/neovim",
		config = function()
			require('rose-pine').setup({
				variant = "auto", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				styles = {
					bold = true,
					italic = true,
					transparency = false,
				},

				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					headings = {
						h1 = "iris",
						h2 = "foam",
						h3 = "rose",
						h4 = "gold",
						h5 = "pine",
						h6 = "foam",
					},
					-- Alternatively, set all headings at once.
					-- headings = "subtle",
				},

				highlight_groups = {
					-- Comment = { fg = "foam" },
					-- VertSplit = { fg = "muted", bg = "muted" },
				},

				before_highlight = function(group, highlight, palette)
					-- Disable all undercurls
					-- if highlight.undercurl then
					--     highlight.undercurl = false
					-- end
					--
					-- Change palette colour
					-- if highlight.fg == palette.pine then
					--     highlight.fg = palette.foam
					-- end
				end,
			})

			vim.cmd('colorscheme rose-pine')
			vim.cmd("hi NonText guifg=bg")
		end
	}
}
