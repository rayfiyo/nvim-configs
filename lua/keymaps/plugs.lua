-- プレーンnvim で利用可能な keymap は base.lua
--[[基本noremap、<Plug>時map、Lua関数可
    command_mode      "c"
    insert_mode       "i"
    normal_mode       "n"
    term_mode         "t"
    visual_mode       "v"
    visual_block_mode "x"

    noremap ではない（素のvimのではない）
    {remap = true}            ]]

----------
-- 準備 --
----------

local map = vim.keymap.set
vim.g.mapleader = " " -- リーダーキーを スペース に
vim.g.maplocalleader = " " -- リーダーキーを スペース に

--------------
-- 基本機能 --
--------------
map("n", "<ESC><ESC>", "<cmd>noh<CR>") -- Escキー をタブルクリックで、ハイライト削除
map("n", "！", "!") -- <cmd>wq！用
map("n", "っd", "dd") -- 全角・半角間違い用
map("n", "っy", "yy") -- 全角・半角間違い用
map("n", "うう", "uu") -- 全角・半角間違い用
map({ "n", "i" }, "<F2>", "<Esc>:w<CR>:!xsel -bi < %<CR>")
map({ "n", "i" }, "<F6>", "<Esc>:w<CR>:!go test %<CR>")
map({ "n", "i" }, "<F5>", function()
	local current_filetype = vim.bo.filetype
	if current_filetype == "c" then
		vim.cmd("update")
		vim.cmd("!gcc -lm %")
	elseif current_filetype == "go" then
		vim.cmd("update")
		vim.cmd("!go run %")
	elseif current_filetype == "typst" then
		vim.cmd("update")
		vim.cmd("!TYPST_FONT_PATHS=/usr/share/fonts/ typst compile %")
	end
end, { silent = true })
-- map("i", "{", "{}<ESC>i") -- 閉じ｛括弧の入力
-- map("i", "{<Enter>", "{}<ESC>i<CR><ESC><S-o>") -- 閉じ（括弧の入力
-- map("i", "()", "()<ESC>i") -- 閉じ（括弧の入力
-- map("i", "()<Enter>", "<ESC>i<CR><ESC><S-o>") -- 閉じ（括弧の入力

---------
-- LSP --
---------
map("n", "<leader>e", vim.diagnostic.open_float, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)

map("n", "<Leader>j", "<cmd>bnext<CR>") -- 次のバッファに移動
map("n", "<Leader>k", "<cmd>bprev<CR>") -- 前のバッファに移動
map({ "i", "n" }, "<C-f>", "<C-x><C-o>") -- オムニ補完

-- フォーマット（mhartington/formatter.nvim がなければ LSP）
map({ "n", "v" }, "<leader>f", function()
	local config = require("formatter.config").values.filetype
	local current_filetype = vim.bo.filetype
	-- 現在のファイルタイプの formatter.config が存在しない（nil）か
	if config[current_filetype] == nil then
		vim.lsp.buf.format({ async = true })
	else
		vim.cmd("Format")
	end
end, { silent = true })
local opts = { noremap = true, silent = true }

-------------------
-- plugin 依存 --
-------------------
-- chomosuke/typst-preview.nvim
map({ "n", "v" }, "<leader>ot", "<cmd>TypstPreview<CR>")
-- Eandrju/cellular-automaton.nvim
map({ "n", "v" }, "<leader>m", "<cmd>CellularAutomaton make_it_rain<CR>")
-- github/copilot.vim
map({ "n", "v" }, "<leader>c", "<cmd>Copilot auth<CR>")
-- mhartington/formatter.nvim
-- map({ "n", "v" }, "<leader>f", "<cmd>Format<CR>")
-- previm/previm
map({ "n", "v" }, "<leader>op", "<cmd>PrevimOpen<CR>")
-- skanehira/translate.vim
map({ "n", "v" }, "<leader>t", "<cmd>Translate<CR>")
-- tpope/vim-commentary
map({ "n", "v", "i" }, "<C-_>", "gcc", { remap = true })
-- tyru/open-browser.vim
-- map({ "n", "v" }, "<leader><C-l>", "<Plug>(openbrowser-smart-search)")
