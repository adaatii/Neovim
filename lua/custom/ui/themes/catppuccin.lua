vim.opt.termguicolors = true
local transparency = true

require("catppuccin").setup({
    flavour = "mocha",
    show_end_of_buffer = true,
    transparent_background = transparency,
    integrations = {
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
                ok = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
                ok = { "underline" },
            },
            inlay_hints = {
                background = true,
            },
        },
        barbecue = {
            dim_dirname = true, -- directory name is dimmed by default
            bold_basename = true,
            dim_context = true,
            alt_background = false,
        },
        flash = true,
        gitsigns = true,
        neogit = true,
        nvim_surround = true,
        lsp_trouble = true,
        which_key = true,
        mason = true,
        notify = true,
        neotree = true,
        window_picker = true,
        illuminate = { enabled = true, lsp = false },
        indent_blankline = { enabled = true, colored_indent_levels = false, },
        telescope = { enabled = true, style = "nvchad", },
    },
})
vim.cmd.colorscheme({args = {"catppuccin"}})
