return {
	{
		-- code highlights
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup {
				-- Add languages to be installed here that you want installed for treesitter
				ensure_installed = { 'cpp', 'lua', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim' },

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
				auto_install = false,

				ignore_install = {},

				modules = {},

				highlight = {
					enable = true,
					disable = function(lang, buf)
						if lang == "rust" then
							return false
						end
						if lang == "cpp" then
							return false
						end
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
				},

				-- indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = '<c-space>',
						node_incremental = '<c-space>',
						scope_incremental = '<c-s>',
						node_decremental = '<M-space>',
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							['aa'] = '@parameter.outer',
							['ia'] = '@parameter.inner',
							['af'] = '@function.outer',
							['if'] = '@function.inner',
							['ac'] = '@class.outer',
							['ic'] = '@class.inner',
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							[']m'] = '@function.outer',
							[']]'] = '@class.outer',
						},
						goto_next_end = {
							[']M'] = '@function.outer',
							[']['] = '@class.outer',
						},
						goto_previous_start = {
							['[m'] = '@function.outer',
							['[['] = '@class.outer',
						},
						goto_previous_end = {
							['[M'] = '@function.outer',
							['[]'] = '@class.outer',
						},
					},
					swap = {
						enable = true,
						swap_next = {
							['<leader>a'] = '@parameter.inner',
						},
						swap_previous = {
							['<leader>A'] = '@parameter.inner',
						},
					},
				},
			}
		end
	},
	-- lets you see the current function you're in if its long enough to be out
	-- of scope
	"nvim-treesitter/nvim-treesitter-context",
}
