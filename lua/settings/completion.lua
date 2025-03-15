require("mini.completion").setup()

local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup({
    gen_loader.from_lang(),
})

