-- Leader key
vim.g.mapleader = " "

-- Quick exit
vim.keymap.set("n", "<leader><s-q>", "<cmd>qa!<cr>", { desc = "Quick Exit", silent = true })

-- Quick save
vim.keymap.set("n", "<leader><s-w>", "<cmd>w<cr>", { desc = "Quick Save", silent = true })

-- Buffer navigation
vim.keymap.set("n", "<C-Left>", "<cmd>bp<cr>", { desc = "Previous Buffer", noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "<cmd>bn<cr>", { desc = "Next Buffer", noremap = true, silent = true })
local delete = require("custom.extra.buffers").smart_bufdelete
vim.keymap.set("n", "<C-Up>", delete, { desc = "Close Buffer", noremap = true, silent = true })
