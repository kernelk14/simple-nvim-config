local lsp = require("lspconfig")
-- local coq = require("coq")

local util = lsp.util

local lsps = {
    "lua_ls",
    "clangd",
    "omnisharp",
    "gopls",
}

require("mason").setup({
    log_level = vim.log.levels.DEBUG,
    providers = { "mason.providers.client", },
    registries = {
        "github:mason-org/mason-registry",
    },
    github = {
        download_url_template = 'https://github.com/%s/releases/download/%s/%s',
    }
})
require("mason-lspconfig").setup({
    --automatic_enable = false,
    ensure_installed = lsps,
})

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


lsp.lua_ls.setup({
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = {
                globals = { 'vim' },
            },
        },
        workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
        },
    },
    capabilities = capabilities
})

lsp.html.setup({capabilities = capabilities})
lsp.emmet_language_server.setup({capabilities = capabilities})
lsp.pyright.setup({capabilities = capabilities})
lsp.cssls.setup({capabilities = capabilities})
lsp.clangd.setup({capabilities = capabilities})

-- local omnisharp_bin = "/home/khyle/.local/share/nvim/mason/bin/omnisharp"
local omnisharp_bin = "omnisharp"

lsp.omnisharp.setup({
    cmd = { omnisharp_bin },
    settings = {
        FormattingOptions = {
        -- Enables support for reading code style, naming convention and analyzer
        -- settings from .editorconfig.
        EnableEditorConfigSupport = true,
        -- Specifies whether 'using' directives should be grouped and sorted during
        -- document formatting.
        OrganizeImports = nil,
      },
      MsBuild = {
        -- If true, MSBuild project system will only load projects for files that
        -- were opened in the editor. This setting is useful for big C# codebases
        -- and allows for faster initialization of code navigation features only
        -- for projects that are relevant to code that is being edited. With this
        -- setting enabled OmniSharp may load fewer projects and may thus display
        -- incomplete reference lists for symbols.
        LoadProjectsOnDemand = nil,
      },
      RoslynExtensionsOptions = {
        -- Enables support for roslyn analyzers, code fixes and rulesets.
        EnableAnalyzersSupport = nil,
        -- Enables support for showing unimported types and unimported extension
        -- methods in completion lists. When committed, the appropriate using
        -- directive will be added at the top of the current file. This option can
        -- have a negative impact on initial completion responsiveness,
        -- particularly for the first few completion sessions after opening a
        -- solution.
        EnableImportCompletion = nil,
        -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
        -- true
        AnalyzeOpenDocumentsOnly = nil,
      },
      Sdk = {
        -- Specifies whether to include preview versions of the .NET SDK when
        -- determining which version to use for project loading.
        IncludePrereleases = true,
      },
    },
    root_dir = util.root_pattern('*.sln', '*.csproj', 'omnisharp.json', 'function.json'),
    capabilities = capabilities
})


-- for _, server in ipairs(lsps) do
--     lsp[server].setup{ capabilities = capabilities }
-- end
