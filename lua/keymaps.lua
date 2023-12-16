local map = vim.keymap.set
--[[ memo<cmd> 基本noremap、<Plug>時map、Lua関数可
    command_mode<cmd>      "c"
    insert_mode<cmd>       "i"
    normal_mode<cmd>       "n"
    term_mode<cmd>         "t"
    visual_mode<cmd>       "v"
    visual_block_mode<cmd> "x" ]]

--- normal keymap ---
vim.g.mapleader = " " -- リーダーキーを スペース に
vim.g.maplocalleader = " " -- リーダーキーを スペース に
map("n", "<ESC><ESC>", "<cmd>noh<CR>") -- Escキー をタブルクリックで、ハイライト削除
map({ "i", "v", "x" }, "<C-c>", "yy") -- C-c でコピー
map("n", "！", "!") -- <cmd>wq！用
map("n", "っd", "dd") -- 全角・半角間違い用
map("n", "っy", "yy") -- 全角・半角間違い用
map("n", "うう", "uu") -- 全角・半角間違い用

--- LSP ---
map("n", "<Leader>j", "<cmd>bnext<CR>") -- 次のバッファに移動
map("n", "<Leader>k", "<cmd>bprev<CR>") -- 前のバッファに移動
map({ "i", "n" }, "<C-f>", "<C-x><C-o>") -- オムニ補完

--- plugin keymap ---
-- Eandrju/cellular-automaton.nvim
map({ "n", "v" }, "<leader>m", "<cmd>CellularAutomaton make_it_rain<CR>")
-- mhartington/formatter.nvim
map({ "n", "v" }, "<leader>f", "<cmd>Format<CR>")
-- previm/previm
map({ "n", "v" }, "<C-p>", "<cmd>PrevimOpen<CR>")
-- skanehira/translate.vim
map({ "n", "v" }, "<leader>t", "<cmd>Translate<CR>")
-- tyru/open-browser.vim
map({ "n", "v" }, "<leader><C-l>", "<Plug>(openbrowser-smart-search)")
