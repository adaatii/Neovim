local lsp_zero = require("lsp-zero").preset({
    name = 'recommended',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})

require('lspconfig').intelephense.setup({})
-- Languages
local servers = {
    "dockerls",
    "docker_compose_language_service",
    "tsserver",
    "html",
    "cssls",
    "cssmodules_ls",
    "jsonls",
    "marksman",
    "bashls",
    "rust_analyzer",
    "clangd",
    "texlab",
    "gopls",
    "lua_ls",
    "pyright",
    "intelephense",
}

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = servers,
    handlers = {
        lsp_zero.default_setup,
        jdtls = lsp_zero.noop,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    }
})
lsp_zero.automatic_installation = {
    --exclude = {
    --    "jdtls"
    --}
}

-- (Optional) Configure lua language server for neovim
lsp_zero.setup()
vim.diagnostic.config({
    virtual_text = true,
})

--require("mason").setup()
