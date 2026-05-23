require("image").setup({
    -- IMPORTANTE: Mude para "wezterm" se você não usar o Kitty Terminal
    backend = "kitty", 
    integrations = {
        markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true, -- Permite ver imagens de links da web!
            only_render_image_at_cursor = false,
            filetypes = { "markdown", "vimwiki" },
        },
    },
    max_width = nil,
    max_height = nil,
    max_width_window_percentage = nil,
    -- A imagem ocupará no máximo 50% da altura da tela para não cobrir todo o texto
    max_height_window_percentage = 50, 
    window_overlap_clear_enabled = true,
    -- Garante que menus flutuantes não fiquem atrás da imagem
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "notify" },
})
