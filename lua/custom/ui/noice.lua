require("noice").setup({
    cmdline = {
        format = {
            cmdline = { icon = ">" },
            search_down = { icon = "󰍉 " },
            search_up = { icon = "󰍉 " },
            filter = { icon = "$" },
            lua = { icon = "󰢱 " },
            help = { icon = "?" },
        },
    },
    format = {
        level = {
            icons = {
                error = "✖",
                warn = "▼",
                info = "●",
            },
        },
    },
})

-- Notifications
local notifications = require("notify")

-- Adicione o setup aqui para resolver o aviso do fundo!
notifications.setup({
    background_colour = "#11151c", -- O azul profundo do OneDark
})

vim.keymap.set({"n", "v"}, "<leader>cn", function() notifications.dismiss() end, { desc = "Dismiss notifications" })
