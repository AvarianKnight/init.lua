return {
    {
        'romgrk/barbar.nvim',
		event = "VimEnter",
        dependencies = {
            'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        opts = {
            icons = {
                buffer_index = true,
            }
        },
        version = '^1.0.0',
		keys = {

			{ '\\>', '<Cmd>BufferMovePrevious<CR>', desc = "Move the current tab backwards" },
			{ '\\<', '<Cmd>BufferMoveNext<CR>', desc = "Move the current tab forward" },

            -- Goto buffer in position...
			{ '\\1', '<Cmd>BufferGoto 1<CR>', desc = "Goto buffer at the current index" },
            { '\\2', '<Cmd>BufferGoto 2<CR>', desc = "Goto buffer at the current index" },
            { '\\3', '<Cmd>BufferGoto 3<CR>', desc = "Goto buffer at the current index" },
            { '\\4', '<Cmd>BufferGoto 4<CR>', desc = "Goto buffer at the current index" },
            { '\\5', '<Cmd>BufferGoto 5<CR>', desc = "Goto buffer at the current index" },
            { '\\6', '<Cmd>BufferGoto 6<CR>', desc = "Goto buffer at the current index" },
            { '\\7', '<Cmd>BufferGoto 7<CR>', desc = "Goto buffer at the current index" },
            { '\\8', '<Cmd>BufferGoto 8<CR>', desc = "Goto buffer at the current index" },
            { '\\9', '<Cmd>BufferGoto 9<CR>', desc = "Goto buffer at the current index" },
            { '\\0', '<Cmd>BufferLast<CR>', desc = "Goto buffer at the current index" },

            -- Pin/unpin buffer
			{ '\\p', '<Cmd>BufferPin<CR>', desc = "Pins the current buffer" },

            -- Close buffer
			{ '\\c', '<Cmd>BufferClose<CR>', desc = "Closes the current buffer" },
			{ '\\fc', '<Cmd>BufferClose!<CR>', desc = "Closes the current buffer" },
		},
    },
}
