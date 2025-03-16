-- require("mini.completion").setup()
--
-- local gen_loader = require("mini.snippets").gen_loader
-- require("mini.snippets").setup({
--     gen_loader.from_lang(),
-- })

vim.cmd [[ :COQnow ]]

init = function()
    vim.g.coq_settings = {
        auto_start = true
    }
end
