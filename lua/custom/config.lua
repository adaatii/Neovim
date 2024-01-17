-- INFO --
-- Use vim.opt to replace "set" configurations,
-- Use vim.g to replace "let" configurations.

-- Number sidebar
vim.opt.relativenumber = true
vim.opt.number = true

-- Disable swapfile
vim.opt.swapfile = false

-- Lines
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"

-- Mouse
vim.opt.mouse = "a"

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Indentation
vim.opt.tabstop = 4      -- number of columns occupied by a tab
vim.opt.softtabstop = 4  -- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = true -- converts tabs to white space
vim.opt.shiftwidth = 4   -- width for autoindents
vim.opt.autoindent = true

-- Keybinds
require("custom.remaps")

-- Plugins
require("custom.plugin-bootstrap")

-- Colorscheme
--require("custom.dracula")
-- Lua initialization file
vim.cmd [[colorscheme nightfly]]
