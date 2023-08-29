local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Re-order to previous/next
map('n', '\\>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '\\<', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
map('n', '\\1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '\\2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '\\3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '\\4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '\\5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '\\6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '\\7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '\\8', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '\\9', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '\\0', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
map('n', '\\p', '<Cmd>BufferPin<CR>', opts)

-- Close buffer
map('n', '\\c', '<Cmd>BufferClose<CR>', opts)
