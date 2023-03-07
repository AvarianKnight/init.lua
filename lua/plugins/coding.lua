return {
    "ray-x/lsp_signature.nvim",
    {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    },
    {
        "danymat/neogen",
        keys = {
            {
                "<leader>cc",
                function()
                    require("neogen").generate({})
                end,
                desc = "Neogen Comment",
            },
        },
        opts = { snippet_engine = "luasnip" },
    },
    {
        "echasnovski/mini.pairs",
        version = false,
        config = function()
            require('mini.pairs').setup()
        end,
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                mappings = {},
            })
        end
    },
}
