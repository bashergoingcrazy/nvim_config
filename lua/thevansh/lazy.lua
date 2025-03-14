-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "


require("lazy").setup({
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { { "nvim-lua/plenary.nvim" } }
    },

    -- Colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },

    -- Utility Plugins
    { "theprimeagen/harpoon" },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
    { "ThePrimeagen/vim-be-good" },
   -- { "github/copilot.vim" },

    -- Git Signs
    { "lewis6991/gitsigns.nvim" },

    -- Snippets
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },

    -- LSP Setup
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "neovim/nvim-lspconfig" },
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
        }
    },

    -- DAP (Debugger Adapter Protocol)
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            { "mfussenegger/nvim-dap" },
            { "nvim-neotest/nvim-nio" }
        }
    },

    -- Context nvim
    {'wellle/context.vim'},

    -- Commenting Plugins
--    {
  --      "JoosepAlviste/nvim-ts-context-commentstring",
    --    config = function()
      --      require("ts_context_commentstring").init({})
        --end
    --},
    {
        "numToStr/Comment.nvim",
        -- config = function()
        --     -- require("Comment").init {
        --     --     pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        --     -- }
        -- end
    },

    -- Additional Plugins
    { "rebelot/kanagawa.nvim" },
    {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
},
    { "nathom/tmux.nvim" },

    -- Bracket & Tag Auto-completion
    { "m4xshen/autoclose.nvim" },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").init({})
        end
    },
})

