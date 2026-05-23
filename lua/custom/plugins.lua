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

local plugins = {
    -- CORE & THEME
--    { 
--        "catppuccin/nvim", 
--        name = "catppuccin", 
--        priority = 1000, 
--        config = function() require("custom.ui.themes.catppuccin") end,
--    },
    {
        "navarasu/onedark.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function () require("custom.ui.themes.onedark") end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate", -- Atualizado: 'run' foi substituído por 'build' no lazy.nvim
        config = function() require("custom.highlighting.syntax") end,
    },

    -- INTERFACE (UI & Status)
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        config = function() require("custom.ui.dressing") end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
        config = function() require("custom.ui.noice") end,
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        -- event = "VeryLazy",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function() require("custom.ui.status.bufferline") end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
        config = function() require("custom.ui.status.lualine") end,
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-treesitter/nvim-treesitter-context",
            "nvim-tree/nvim-web-devicons",
        },
        config = function() require("custom.ui.status.context") end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPre", "BufNewFile" }, -- Só carrega ao abrir um arquivo
        config = function() require("custom.behavior.indentation") end
    },

    -- NAVIGATION & EXPLORATION
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            {
                "s1n7ax/nvim-window-picker",
                config = function() require("custom.ui.window-picker") end
            },
        },
        config = function() require("custom.ui.file-tree") end
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-project.nvim",
            "benfowler/telescope-luasnip.nvim",
        },
        config = function() require("custom.navigation.telescope") end,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        config = function() require("custom.navigation.flash") end,
    },
    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        config = function() require("custom.navigation.scrolling") end,
    },
    {
        "kevinhwang91/nvim-hlslens",
        event = "VeryLazy",
        dependencies = "RRethy/vim-illuminate",
        config = function() require("custom.highlighting.search") end,
    },

    -- EDITOR & BEHAVIOR
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        desc = "Keybinds",
        config = function() require("custom.keymaps.which-key") end,
    },
    {
        "windwp/nvim-autopairs",
        version = "*",
        event = "InsertEnter", -- Otimização: só carrega quando você começa a digitar
        dependencies = { "kylechui/nvim-surround", version = "*" },
        config = function() require("custom.behavior.surround") end,
    },
    {
        "Wansmer/treesj",
        event = "VeryLazy",
        config = function() require("custom.behavior.join") end
    },
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("custom.highlighting.comments") end,
    },
    {
        "NvChad/nvim-colorizer.lua",
        event = { "BufReadPre", "BufNewFile" },
        config = function() require("custom.highlighting.colors") end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        event = "VeryLazy",
        config = function() require("custom.ui.terminal") end,
    },
    {
        "OXY2DEV/markview.nvim",
        ft = "markdown", -- Otimização: só carrega se o arquivo for markdown
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        config = function() require("custom.lsp.languages.markdown") end,
    },

    -- GIT
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function() require("custom.git.signs") end
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim"
        },
        config = function() require("custom.git.neogit") end,
    },

    -- EXTRAS & INTEGRATIONS
    {
        "github/copilot.vim",
        config = function() require("custom.extra.copilot") end
    },
    {
        "vyfor/cord.nvim",
        build = './build',
        event = 'VeryLazy',
        config = function() require("custom.extra.discord-integration") end
    },
    {
        "michaelrommel/nvim-silicon",
        event = "VeryLazy",
        config = function() require("custom.extra.screenshots") end,
    },
    --AUTOCOMPLETAR & SNIPPETS
    {
        "hrsh7th/nvim-cmp",
        event = "VeryLazy",
        dependencies = {
            -- Fontes do autocompletar
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",

            -- Motor de Snippets
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                build = "make install_jsregexp",
                dependencies = { "rafamadriz/friendly-snippets" },
            },
            "saadparwaiz1/cmp_luasnip",

            -- Auto-pairs (Fecha parênteses automaticamente junto com o cmp)
            "windwp/nvim-autopairs",
        },
        config = function() 
            require("custom.lsp.cmp") 
        end,
    },

    -- LSP & MASON
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "lukas-reineke/lsp-format.nvim",
            "mfussenegger/nvim-dap",
            "jay-babu/mason-nvim-dap.nvim",
        },
        config = function() 
            require("custom.lsp.lspconfig") 
        end,
    },
    -- Markdown
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function() require("custom.lsp.languages.markdown") end,
    },
    --   Debugger
    {
        "rcarriga/nvim-dap-ui",
        config = function() require("custom.lsp.dap") end,
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
    },
    -- Dashboard
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function() require("custom.ui.dashboard") end,
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
}

-- Setup lazy.nvim
require("lazy").setup({
    spec = plugins, 
    checker = {enable = true}
})
