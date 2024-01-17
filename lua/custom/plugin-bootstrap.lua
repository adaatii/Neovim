-- Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
    -- Startup
    {
        "lewis6991/impatient.nvim",
        lazy = false,
        config = function()
            require("custom.plugins.impatient")
        end,
    },
    -- Colorscheme
    --    {
    --        "navarasu/onedark.nvim",
    --        config = function()
    --            require("custom.colorscheme")
    --        end,
    --        priority = 300,
    --    },
    --	{
    --		"Mofiqul/dracula.nvim",
    --		config = function()
    --			require("custom.dracula")
    --		end,
    --		priority = 300,
    --	},
    --{
    --    'rose-pine/neovim',
    --    name = 'rose-pine',
    --    config = function()
    --        vim.cmd('colorscheme rose-pine')
    --    end,
    --},
    { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
    -- Status Bar
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("custom.plugins.lualine")
        end,
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        config = function()
            require("custom.plugins.bufferline")
        end,
    },
    -- Syntax
    {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            vim.cmd([[:TSUpdate]])
        end,
        config = function()
            require("custom.plugins.treesitter")
        end,
        priority = 400,
    },
    {
        "yioneko/nvim-yati",
        version = "*",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    -- Highlighting
    {
        "kevinhwang91/nvim-hlslens",
        config = function()
            require("custom.plugins.hlslens")
        end,
    },
    {
        "RRethy/vim-illuminate",
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("custom.plugins.indent-blankline")
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    -- Tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("custom.plugins.nvim-tree")
        end,
    },
    -- Comments
    {
        "preservim/nerdcommenter",
        config = function()
            require("custom.plugins.nerdcommenter")
        end,
    },
    { "MunifTanjim/nui.nvim" },
    {
        "folke/noice.nvim",
        config = function()
            require("custom.plugins.noice")
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            require("custom.plugins.nvim-notify")
        end,
    },
    -- LSP
    {
        "VonHeikemen/lsp-zero.nvim",
        version = "v1.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
        config = function()
            require("custom.plugins.lsp")
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
    },
    {
        "folke/trouble.nvim",
        config = function()
            require("custom.plugins.trouble")
        end,
    },
    --    {
    --        'IogaMaster/neocord',
    --        event = "VeryLazy",
    --        config = function()
    --            --require("neocord").setup()
    --            require("custom.plugins.neocord")
    --        end,
    --    },
    {
        "andweeb/presence.nvim",
        config = function()
            --	require("presence").setup({})
            require("custom.plugins.presence")
        end,
    },
    {
        "stevearc/conform.nvim",
        lazy = true,
        event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
        config = function()
            require("conform").setup({})
            require("custom.plugins.conform")
        end,
    },
    {
        'nvim-lua/plenary.nvim'
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'mbbill/undotree'
    },
    {
        'github/copilot.vim'
    },
    {
        'akinsho/git-conflict.nvim', version = "*", config = true
    },
    -- Lazy Configuration
    ui = {
        size = { width = 0.9, height = 0.4 },
        border = "single",
    },
})
