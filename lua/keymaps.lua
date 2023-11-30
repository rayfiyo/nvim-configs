local map = vim.keymap.set
--[[ memo: 基本noremap、<Plug>時map、Lua関数可
	command_mode:      "c"
	insert_mode:       "i"
	normal_mode:       "n"
	term_mode:         "t"
	visual_mode:       "v"
	visual_block_mode: "x" ]]

--- normal keymap ---
vim.g.mapleader = " " -- リーダーキーを スペース に
vim.g.maplocalleader = " " -- リーダーキーを スペース に
map("n", "<ESC><ESC>", ":noh<Return>") -- Escキー をタブルクリックで、ハイライト削除
map({ "i", "v", "x" }, "<C-c>", "yy") -- C-c でコピー
map("n", "！", "!") -- :wq！用
map("n", "っd", "dd") -- 全角・半角間違い用
map("n", "っy", "yy") -- 全角・半角間違い用
map("n", "うう", "uu") -- 全角・半角間違い用

--- LSP ---
map("n", "<Leader>j", ":bnext<Return>") -- 次のバッファに移動
map("n", "<Leader>k", ":bprev<Return>") -- 前のバッファに移動
map({ "i", "n" }, "<C-f>", "<C-x><C-o>") -- オムニ補完

--- plugin keymap ---
-- Eandrju/cellular-automaton.nvim
map({ "n", "v" }, "<leader>m", ":CellularAutomaton make_it_rain<Return>")
-- mhartington/formatter.nvim
--map({"n", "v"}, "<leader>f", ":FormatWrite<Return>")
-- previm/previm
map({ "n", "v" }, "<C-p>", ":PrevimOpen<Return>")
-- skanehira/translate.vim
map({ "n", "v" }, "<leader>t", ":Translate<Return>")
-- tyru/open-browser.vim
map({ "n", "v" }, "<leader><C-l>", "<Plug>(openbrowser-smart-search)")
