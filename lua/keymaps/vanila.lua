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

-- リーダーキーをスペースにする設定
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- マッピング
map("n", "<ESC><ESC>", "<cmd>noh<CR>") -- Escキー をタブルクリックで、ハイライト削除
map("n", ":wq！", ":wq!")   -- <cmd>wq！用
map("n", ":q！", ":q!")     -- <cmd>q！用
map("n", "っd", "dd")       -- 全角・半角間違い用
map("n", "っy", "yy")       -- 全角・半角間違い用
map("n", "うう", "uu")      -- 全角・半角間違い用
map("n", "い", "i")         -- 全角・半角間違い用
map("n", "あ", "a")         -- 全角・半角間違い用
map("n", "お", "o")         -- 全角・半角間違い用
map({ "n", "i" }, "<F2>", "<Esc>:w<CR>:!xsel -bi < %<CR>")
map({ "n", "i" }, "<F6>", "<Esc>:w<CR>:!go test %<CR>")
map({ "n", "i" }, "<F5>", function()
	-- 現在のファイルタイプ: vim.bo.filetype
	if vim.bo.filetype == "c" then
		vim.cmd("update")
		vim.cmd("!gcc -lm % && echo : && ./a.out")
	elseif vim.bo.filetype == "go" then
		vim.cmd("update")
		vim.cmd("!echo : && go run %")
	elseif vim.bo.filetype == "typst" then
		vim.cmd("update")
		vim.cmd("!TYPST_FONT_PATHS=/usr/share/fonts/ typst compile %")
	end
end, { silent = true })
map({ "i" }, "<C-b>", function() -- Typst で青字のショートカット
	if vim.bo.filetype == "typst" then
		return "**<b><Left><Left><Left><Left>"
	end
end, { expr = true, silent = true }) -- expr で返り値を入力
-- map("i", "{", "{}<ESC>i") -- 閉じ｛括弧の入力
-- map("i", "{<Enter>", "{}<ESC>i<CR><ESC><S-o>") -- 閉じ（括弧の入力
-- map("i", "()", "()<ESC>i") -- 閉じ（括弧の入力
-- map("i", "()<Enter>", "<ESC>i<CR><ESC><S-o>") -- 閉じ（括弧の入力

-- タブのスペース数は vim_opt
