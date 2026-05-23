--local background = require("catppuccin.palettes").get_palette("mocha")
--local flavour = require("catppuccin").flavour
local silicon = require("nvim-silicon")

silicon.setup({
    font = "Iosevka Nerd Font Mono=24;Noto Color Emoji=24",
    theme = "Monokai Extended",
    debug = false,
    --background = background.crust,
    background = "#11151c",
    pad_horiz = 0,
    pad_vert = 0,
    no_round_corner = true,
    no_window_controls = true,
    shadow_blur_radius = 0,
    shadow_offset_x = 0,
    shadow_offset_y = 0,
    to_clipboard = true,
})

vim.keymap.set(
    {"n", "v"}, "<leader>sc", silicon.shoot,
    { desc = "Take a screenshot of the entire file", silent = true }
)
