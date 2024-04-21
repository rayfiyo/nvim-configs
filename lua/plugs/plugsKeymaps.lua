--[[基本noremap、<Plug>時map、Lua関数可
    command_mode      "c"
    insert_mode       "i"
    normal_mode       "n"
    term_mode         "t"
    visual_mode       "v"
    visual_block_mode "x"

    noremap ではない（素のvimのではない）
    {remap = true}            ]]

local map = vim.keymap.set

---------
-- LSP --
---------
map("n", "<Leader>j", "<cmd>bnext<CR>") -- 次のバッファに移動
map("n", "<Leader>k", "<cmd>bprev<CR>") -- 前のバッファに移動
map({ "i", "n" }, "<C-f>", "<C-x><C-o>") -- オムニ補完

-------------------
-- plugin keymap --
-------------------
-- Eandrju/cellular-automaton.nvim
map({ "n", "v" }, "<leader>m", "<cmd>CellularAutomaton make_it_rain<CR>")
-- mhartington/formatter.nvim
map({ "n", "v" }, "<leader>f", "<cmd>Format<CR>")
-- previm/previm
map({ "n", "v" }, "<C-p>", "<cmd>PrevimOpen<CR>")
-- skanehira/translate.vim
map({ "n", "v" }, "<leader>t", "<cmd>Translate<CR>")
-- tpope/vim-commentary
map({ "n", "v", "i" }, "<C-_>", "gcc", { remap = true })
-- tyru/open-browser.vim
map({ "n", "v" }, "<leader><C-l>", "<Plug>(openbrowser-smart-search)")

