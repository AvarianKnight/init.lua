local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fpf', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>fw', function()
	-- If we cancel we want to just discard the error
	pcall(function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
	end)
end, {})
