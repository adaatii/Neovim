vim.cmd[[Copilot setup]]
vim.cmd[[Copilot disable]]

vim.keymap.set('n', '<leader><s-c>e', '<cmd>Copilot enable<cr>', {desc = "Enable Copilot", silent = true})
vim.keymap.set('n', '<leader><s-c>d', '<cmd>Copilot disable<cr>', {desc = "Disable Copilot", silent = true})
