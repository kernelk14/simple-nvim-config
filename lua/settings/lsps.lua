require("mason").setup()
require("mason-lspconfig").setup({
    automatic_enable = false
})

local lspconfig = require("lspconfig")

local servers = {'clangd', 'html', 'cssls','ols', 'gopls'}

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities({}, false))

capabilities = vim.tbl_deep_extend('force', capabilities, {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
  }
})

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup{ capabilities = capabilities }
end

-- lspconfig.clangd.setup {}
-- lspconfig.html.setup {}
-- lspconfig.cssls.setup {}
-- lspconfig.emmet_language_server.setup {}
