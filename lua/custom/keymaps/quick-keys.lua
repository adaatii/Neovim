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


-- HL7
-- Executa o analisador HL7 na linha atual pressionando Espaço + h
vim.keymap.set("n", "<leader>h", "<cmd>HL7<cr>", { desc = "Analisar Segmento HL7", silent = true })

-- Copilot
--vim.cmd[[Copilot disable]]

vim.keymap.set('n', '<leader><s-i>e', '<cmd>Copilot enable<cr>', {desc = "Enable Copilot", silent = true})
vim.keymap.set('n', '<leader><s-i>d', '<cmd>Copilot disable<cr>', {desc = "Disable Copilot", silent = true})

-- PlantUML
vim.keymap.set("n", "<leader><s-v>p", "<cmd>PlantumlOpen<cr>", { desc = "Preview PlantUML", silent = true })

-- Markdown
vim.keymap.set("n", "<leader><s-v>m", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Toggle Markdown Preview", silent = true })

-- Lazy
vim.keymap.set("n", "<leader><s-l>", "<cmd>Lazy<cr>", { desc = "Open Lazy", silent = true })

-- Mason
vim.keymap.set("n", "<leader><s-m>", "<cmd>Mason<cr>", { desc = "Open Mason", silent = true })
