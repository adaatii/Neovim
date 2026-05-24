-- Enable experimental module loader
vim.loader.enable()

require("custom.filetype.custom_filetypes")
-- Load basic behaviour
require("custom.behavior.swap")
require("custom.behavior.mouse")
require("custom.behavior.clipboard")
require("custom.behavior.indentation")
require("custom.behavior.folding")
require("custom.ui.visual-markers")

-- Load quick keymaps
require("custom.keymaps.quick-keys")

-- HL7
require("custom.extra.hl7")

-- Warnings
require("custom.extra.ignore-warnings")


-- Load plugin manager
require("custom.plugins")
