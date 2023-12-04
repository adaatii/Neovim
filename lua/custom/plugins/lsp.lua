local lsp = require("lsp-zero").preset({
	name = "recommended",
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

require('lspconfig').intelephense.setup({})
-- Languages
lsp.ensure_installed({
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
    "prettierd",
})

lsp.automatic_installation = {
	--exclude = {
	--    "jdtls"
	--}
}

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()
lsp.setup()
vim.diagnostic.config({
	virtual_text = true,
})

require("mason").setup()
