require("avarianknight.config")
require("avarianknight.remap")

local augroup = vim.api.nvim_create_augroup
local AvarianGroup = augroup('Avarian', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 70,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = AvarianGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

