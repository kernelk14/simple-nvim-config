local keymap = vim.keymap.set
local opts = {silent = true}

keymap('n', "{", "<cmd>bp<cr>", opts)
keymap('n', "}", "<cmd>bn<cr>", opts)
keymap('n', ";d", "<cmd>bd<cr>", opts)


keymap('n', '<C-n>', "<cmd>NvimTreeToggle<cr>", opts)
keymap('n', ';ff', "<cmd>Telescope file_browser<cr>", opts)
keymap('n', ";gg", "<cmd>Neogit<cr>", opts)


keymap({"n", "v"}, '<A-/>', "<esc>gcc", { remap = true })
keymap("i", '<A-/>', "<esc>gcci", { remap = true })



-- This is for ST and other
--
keymap({"n", "v"}, '<C-_>', "gcc", { remap = true })
--
keymap("i", '<A-_>', "<esc>gcci", { remap = true })
--
