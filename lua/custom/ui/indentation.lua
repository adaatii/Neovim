local char = "│"

require("ibl").setup({
    indent = { char = char },
    scope = { enabled = true },
    exclude = {
        buftypes = { "terminal" },
        filetypes = { "dashboard" },
    },
})
