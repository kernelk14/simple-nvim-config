-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ";"
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration

        -- Only one of these is needed.
        "nvim-telescope/telescope.nvim", -- optional
        "ibhagwan/fzf-lua",              -- optional
        "echasnovski/mini.pick",         -- optional
      },
      config = true
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "echasnovski/mini.nvim",
        version = false
    },
    {
        "nvim-lualine/lualine.nvim",
    },
    { 
        "nvim-tree/nvim-web-devicons",
        opts = {},
    },
    {

        "nvim-telescope/telescope-file-browser.nvim",

        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },
    {
        "nvim-tree/nvim-tree.lua",
    },

    {
        "nvimdev/indentmini.nvim",
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        "rafamadriz/friendly-snippets",
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
    },
    {
        { 'ms-jpq/coq_nvim', branch = 'coq' },
        { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
        { 'ms-jpq/coq.thirdparty', branch = '3p' },
    },
    {
      "folke/trouble.nvim",
      opts = {},
      cmd = "Trouble",
      keys = {
        {
          ";xx",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
       {
          ";xX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          ";cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          ";cl",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
          ";xL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          ";xQ",
          "<cmd>Trouble qflist toggle<cr>",
          desc = "Quickfix List (Trouble)",
        },
      },
    },

  },
  install = { colorscheme = { "tokyonight-night" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
