-- 1. Cria a comunicação de que o Neovim suporta autocompletar moderno (Snippets, etc)
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 2. Configura os atalhos APENAS quando um servidor LSP se conectar a um arquivo
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

        -- Integração com o Navic (Barbecue)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentSymbolProvider then
            -- Ignora o Spring Boot para evitar o conflito duplo com o jdtls
            if client.name ~= "spring-boot" then
                -- Usamos 'pcall' (Protected Call) para silenciar silenciosamente 
                -- qualquer futuro aviso caso dois servidores colidam em outra linguagem
                pcall(require("nvim-navic").attach, client, event.buf)
            end
        end
    end
})

-- 3. Listas de ferramentas
local servers = {
    "dockerls", "docker_compose_language_service",
    "ts_ls", "html", "cssls", "cssmodules_ls", "jsonls",
    "gopls", "texlab", "marksman", "lua_ls", "bashls",
    "pyright", "rust_analyzer", "clangd", "jdtls", "omnisharp",
}

local tools = { "black", "isort", "flake8" }
local debuggers = { "python", "cppdb" }

-- 4. Instalação e Configuração pelo Mason
require("mason").setup({})
require("mason-tool-installer").setup({
    ensure_installed = tools,
    auto_update = true,
})

require("mason-nvim-dap").setup({
    ensure_installed = debuggers,
    automatic_installation = true
})

require("mason-lspconfig").setup({
    ensure_installed = servers,
    handlers = {
        -- Handler Padrão: Configura todos os servidores automaticamente
        function(server_name)
            require('lspconfig')[server_name].setup({
                capabilities = capabilities
            })
        end,
        jdtls = function()
            require('lspconfig').jdtls.setup({
                capabilities = capabilities
            })
        end, -- Substitui o antigo lsp_zero.noop
        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { 'vim' } },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                    }
                }
            })
        end,
        jsonls = function()
            require('lspconfig').jsonls.setup({
                capabilities = capabilities,
                settings = {
                    json = {
                        validate = { enable = true },
                        schemas = {
                            {
                                url = "file://" .. vim.fn.expand("~/.config/nvim/schemas/fhir.schema.json"),
                                fileMatch = { 
                                    "*.fhir.json", 
                                }
                            }
                        }
                    }
                }
            })
        end,
    }
})
