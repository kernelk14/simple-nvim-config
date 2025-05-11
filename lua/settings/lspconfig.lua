local lsp = require("lspconfig")
local coq = require("coq")

local util = lsp.util

local lsps = {
    "lua_ls",
    "pyright",
    "clangd",
    "omnisharp",
    "cssls",
    "html",
    "emmet_language_server",
    "gopls",
}

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = lsps,
})

lsp.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
        workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
        },
    }
}, coq.lsp_ensure_capabilities())

lsp.html.setup(coq.lsp_ensure_capabilities())
lsp.emmet_language_server.setup(coq.lsp_ensure_capabilities())
lsp.pyright.setup(coq.lsp_ensure_capabilities())
lsp.cssls.setup(coq.lsp_ensure_capabilities())
lsp.clangd.setup(coq.lsp_ensure_capabilities())
lsp.omnisharp.setup({
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
}, coq.lsp_ensure_capabilities())

