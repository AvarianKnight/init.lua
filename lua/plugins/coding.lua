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
        "windwp/nvim-autopairs",
        config = function()
            require('nvim-autopairs').setup()
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
