-- Enable experimental module loader
vim.loader.enable()

-- Load basic behaviour
require("custom.behavior.swap")
require("custom.behavior.mouse")
require("custom.behavior.clipboard")
require("custom.behavior.indentation")
require("custom.behavior.folding")
require("custom.ui.visual-markers")

-- Load quick keymaps
require("custom.keymaps.quick-keys")

-- Load plugin manager
require("custom.plugins")
