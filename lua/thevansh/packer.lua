-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',	  -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    }
    -- Tree Sitter 
    use ('nvim-treesitter/nvim-treesitter',{run = ':TSUpdate'})
    use ('theprimeagen/harpoon')
    use ('mbbill/undotree') 
    use ('tpope/vim-fugitive')
    use ('ThePrimeagen/vim-be-good')

    use ('github/copilot.vim')


    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'
    --LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }
    -- This is for Commenting of code 
    use {  'JoosepAlviste/nvim-ts-context-commentstring',
        config = function()
            require('ts_context_commentstring').setup()
        end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
         require('Comment').setup {
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            }
        end
    }
    use "rebelot/kanagawa.nvim"
    -- This is for Bracket Completions
    use 'm4xshen/autoclose.nvim'
    use {'windwp/nvim-ts-autotag',config = function ()
        require('nvim-ts-autotag').setup()
    end}
end)
