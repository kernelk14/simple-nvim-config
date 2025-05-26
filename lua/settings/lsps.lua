require("mason").setup()
require("mason-lspconfig").setup({
    automatic_enable = false
})

require('blink.cmp').setup ({
    keymap = {
    -- set to 'none' to disable the 'default' preset
    preset = 'default',
  
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
    ['<Tab>'] = { 'select_next', 'fallback' },
  
    -- disable a keymap from the preset
    ['<C-e>'] = {},
    
    -- show with a list of providers
    ['<C-space>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
  
  }
})

local lspconfig = require("lspconfig")

local servers = {'clangd', 'html', 'cssls','ols', 'gopls'}

for _, lsp in ipairs(servers) do
    capabilities = require('blink.cmp').get_lsp_capabilities()
    lspconfig[lsp].setup{ capabilities = capabilities }
end

-- lspconfig.clangd.setup {}
-- lspconfig.html.setup {}
-- lspconfig.cssls.setup {}
-- lspconfig.emmet_language_server.setup {}
