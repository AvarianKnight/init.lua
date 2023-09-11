return {
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            require("telescope").setup {
                defaults = {
                    file_ignore_patterns = {
                        "node_modules",
                        ".git/",
                        "dist/*",
                        "html/*",
                    }
                }
            }

            vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
                { desc = '[?] Find recently opened files' })
            vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers,
                { desc = '[ ] Find existing buffers' })
            vim.keymap.set('n', '<leader>fb', function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = '[/] Fuzzily search in current buffer' })

            vim.keymap.set('n', '<leader>fg', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
            vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
            vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>fiw', require('telescope.builtin').grep_string,
                { desc = '[S]earch current [W]ord' })
            vim.keymap.set('n', '<leader>fw', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
            vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics,
                { desc = '[S]earch [D]iagnostics' })

            pcall(require('telescope').load_extension, 'fzf')
        end
    },
}
