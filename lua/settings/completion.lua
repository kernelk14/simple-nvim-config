-- require("mini.completion").setup({
--     window = {
--         info = {
--             height = 25,
--             width = 50,
--             border = 'single',
--         },
--         signature = {
--             height5 = 25,
--             width = 50,
--             border = 'single',
--         },
--     },
--     set_vim_settings = true
-- })



local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup({
    gen_loader.from_lang(),
})
-- vim.cmd [[ :COQnow --shut-up ]]
-- init = function()
--     vim.g.coq_settings = {
--         auto_start = true
--     }
-- end
--


