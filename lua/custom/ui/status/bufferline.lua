local highlights = {}

if (vim.g.colors_name or ""):find("catppuccin") then
    local ok, cat_highlights = pcall(require, "catppuccin.groups.integrations.bufferline")
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
