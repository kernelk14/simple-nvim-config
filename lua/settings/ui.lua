local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.autoindent = true
opt.smartindent = true

opt.hlsearch = true
opt.expandtab = true
opt.cursorline = true

opt.termguicolors = true

vim.cmd [[ syntax enable ]]

vim.cmd [[ colorscheme tokyonight-night ]]

vim.cmd [[ set signcolumn=yes ]]
