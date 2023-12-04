--- Special characters
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("ibl").setup {
    indent = {
        char = "|",
    },
    scope = {
        enabled = true,
    },
}
-- Special characters
--vim.opt.list = true
--vim.opt.listchars:append "space:⋅"
--vim.opt.listchars:append "eol:↴"
--
---- Indentation
--require("indent_blankline").setup {
--    space_char_blankline = " ",
--    show_current_context = true,
--    show_current_context_start = true,
--}
--
