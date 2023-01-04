vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use 'feline-nvim/feline.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use {
        'morhetz/gruvbox',
        as = 'gruvbox',
        config = function()
            vim.cmd("colorscheme gruvbox")
            vim.cmd("hi NonText guifg=bg")
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
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
    }

    use {
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
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
    }

    use {
        "numToStr/Comment.nvim",
        keys = { "gc", "gb" },
        config = function()
            local present, comment = pcall(require, "Comment")

            if not present then
                return print("didn't load comment api")
            end

            comment.setup()
        end
    }
    use {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    }

end)
