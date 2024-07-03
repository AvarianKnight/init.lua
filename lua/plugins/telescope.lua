return {
	{
		'nvim-telescope/telescope.nvim',
		-- version = '0.1.x',
		dependencies = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim', 'nvim-telescope/telescope-live-grep-args.nvim'},
		config = function()
			local telescope = require("telescope")
			telescope.setup {
				defaults = {
					file_ignore_patterns = {
						"node_modules",
						".git/",
						"html/*",
						"dist/*",
						"bin/*",
					},
				},
			}

			-- vim.keymap.set({'i', 'n'}, '<C-t>',  trouble.open_with_trouble)

			vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
				{ desc = '[?] Find recently opened files' })
			vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers,
				{ desc = '[ ] Find existing buffers' })
			vim.keymap.set('n', '<leader>fib', function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					winblend = 10,
					previewer = false,
				})
			end, { desc = '[/] Fuzzily search in current buffer' })

			local builtin = require('telescope.builtin')

			vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
			vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
			vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
			vim.keymap.set('n', '<leader>sw', builtin.grep_string,
				{ desc = '[S]earch current [W]ord' })
			vim.keymap.set('n', '<leader>sg', require("telescope").extensions.live_grep_args.live_grep_args, { desc = '[S]earch by [G]rep' })
			vim.keymap.set('n', '<leader>sd', builtin.diagnostics,
				{ desc = '[S]earch [D]iagnostics' })
			vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })

			pcall(require('telescope').load_extension, 'fzf')
			pcall(require('telescope').load_extension, 'ui-select')
			pcall(require('telescope').load_extension, 'live_grep_args')
		end
	},
}
