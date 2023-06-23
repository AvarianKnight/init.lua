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
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        version = 'nightly'                -- optional, updated every week. (see issue #1193)
    },
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
    -- TODO: Custom keymappings
    -- {
    --     "ggandor/leap.nvim",
    --     dependencies = { { 'tpope/vim-repeat' } },
    --     event = "BufEnter",
    --     config = function()
    --         require('leap').add_default_mappings()
    --     end
    -- },
    "nvim-treesitter/nvim-treesitter-context",
    -- Tabline
    'romgrk/barbar.nvim',
}
