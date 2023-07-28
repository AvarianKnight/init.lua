return {
    'mbbill/undotree',
    'tpope/vim-fugitive',
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufEnter",
        setup = function()
            require("indent_blankline").setup {
                -- for example, context is off by default, use this to turn it on
                show_current_context = true,
                show_current_context_start = true,
            }
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.0',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            require("telescope").setup {
                defaults = {
                    file_ignore_patterns = {
                        "node_modules",
                        ".git",
                        "dist/*",
                        "html/*",
                    }
                }
            }
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                -- options = {
                --     theme = 'tokyonight'
                -- }
            }
        end
    },
    -- {
    --     'nvim-tree/nvim-tree.lua',
    --     dependencies = {
    --         'nvim-tree/nvim-web-devicons', -- optional, for file icons
    --     },
    --     version = 'nightly'                -- optional, updated every week. (see issue #1193)
    -- },
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            -- {
            --     "S",
            --     mode = { "n", "o", "x" },
            --     function()
            --         require("flash").treesitter()
            --     end,
            --     desc = "Flash Treesitter",
            -- },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
        },
    },
    "nvim-treesitter/nvim-treesitter-context",
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        },
        config = function()
            require('refactoring').setup({})
        end
    },
    "wakatime/vim-wakatime",
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
    'prichrd/netrw.nvim'
}
