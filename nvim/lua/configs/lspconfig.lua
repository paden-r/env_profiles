require("neodev").setup({})

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {}
lspconfig.pyright.setup { settings = { python = { analysis = { autoImport = false } } } }
lspconfig.tailwindcss.setup {}
lspconfig.csharp_ls.setup {}
lspconfig.sqls.setup {
    on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr)
        client.server_capabilities.hoverProvider = false
    end
}

lspconfig.ruff.setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.hoverProvider = false
    end
    ,
    init_options = {
        settings = {
            format = {
                args = { "--preview" }
            },
            lint = {
                args = { "--preview" },
            }
        }
    }
}
-- lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {
    -- Server-specific settings. See `:help lspconfig-setup`
    settings = {
        ['rust-analyzer'] = {},
    },
}
