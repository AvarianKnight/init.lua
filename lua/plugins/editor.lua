return {
    'mbbill/undotree',
    'tpope/vim-fugitive',
    "Yggdroot/indentLine",
    {
        'nvim-telescope/telescope.nvim', version = '0.1.0',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            require("telescope").setup {
                defaults = {
                    file_ignore_patterns = {
                        "node_modules",
                        ".git",
                        "dist/*"
                    }
                }
            }
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'tokyonight'
                }
            }
        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        version = 'nightly' -- optional, updated every week. (see issue #1193)
    },
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    },
    "nvim-treesitter/nvim-treesitter-context",
    -- Tabline
    'romgrk/barbar.nvim',
}
