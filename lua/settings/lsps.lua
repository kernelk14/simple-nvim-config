require("mason").setup()
require("mason-lspconfig").setup({
    automatic_enable = false
})

local lspconfig = require("lspconfig")


local servers = {'clangd', 'html', 'cssls', 'emmet_language_server', 'ols', 'gopls'}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {}
end

-- lspconfig.clangd.setup {}
-- lspconfig.html.setup {}
-- lspconfig.cssls.setup {}
-- lspconfig.emmet_language_server.setup {}
