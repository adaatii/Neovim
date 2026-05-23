local highlights = {}

-- If want to use catppuccin, uncomment the following lines and comment out the onedark lines
-- if (vim.g.colors_name or ""):find("catppuccin") then
--     local ok, cat_highlights = pcall(require, "catppuccin.groups.integrations.bufferline")
--     if ok and cat_highlights.get_theme then
--         highlights = cat_highlights.get_theme()
--     end
-- end
if (vim.g.colors_name or ""):find("onedark") then
    local ok, cat_highlights = pcall(require, "onedark.groups.integrations.bufferline")
    if ok and cat_highlights.get_theme then
        highlights = cat_highlights.get_theme()
    end
end

require("bufferline").setup({
    options = {
        numbers = "ordinal",
        diagnostics = "lsp",
    },
    highlights = highlights,
})
