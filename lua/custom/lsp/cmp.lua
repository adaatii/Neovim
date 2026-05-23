local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

-- Carrega os snippets amigáveis (friendly-snippets)
require('luasnip.loaders.from_vscode').lazy_load()

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    -- Declara o motor de snippets para o CMP
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    -- Formatação visual do menu (Substitui o lsp_zero.cmp_format)
    formatting = {
        fields = {'abbr', 'menu', 'kind'},
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = '[LSP]',
                luasnip = '[Snippet]',
                buffer = '[Buffer]',
                path = '[Path]',
                cmdline = '[Cmd]',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Tab>'] = cmp.config.disable,
        ['<S-Tab>'] = cmp.config.disable,
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        
        -- Substitui os comandos antigos do lsp-zero pelos nativos do Luasnip
        ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
})

-- Autocompletar para busca (/)
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Autocompletar para comandos (:)
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        }
    })
})

-- Fecha parênteses automaticamente após confirmar uma função no autocompletar
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
