return {
    {
        'folke/tokyonight.nvim',
        name = "tokyonight",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd('colorscheme tokyonight')
            vim.cmd("hi NonText guifg=bg")
        end
    },
}
