require("lazy").setup({
    'romgrk/barbar.nvim',
    'wbthomason/packer.nvim',
    'mbbill/undotree',
    'tpope/vim-fugitive',
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
    "ray-x/lsp_signature.nvim",
    -- {
    --     "savq/melange-nvim",
    --     config = function()
    --         vim.cmd('colorscheme melange')
    --         vim.cmd("hi NonText guifg=bg")
    --     end
    -- },
    {
        'nvim-telescope/telescope.nvim', version = '0.1.0',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
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

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            local present1, autopairs = pcall(require, "nvim-autopairs")
            local present2, cmp = pcall(require, "cmp")

            if not (present1 and present2) then
                return
            end

            local options = {
                disable_filetype = { "TelescopePrompt", "vim" },
            }

            autopairs.setup(options)

            local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                mappings = {},
            })
        end
    },


    {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    },
    "simrat39/rust-tools.nvim"
})
