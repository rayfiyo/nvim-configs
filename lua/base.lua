-- "vim.opt.*" 以外の設定
-- https://zenn.dev/hisasann/articles/neovim-settings-to-lua

-- Luaファイルをバイトコンパイルしてキャッシュする
-- https://coralpink.github.io/commentary/outro/lazy.html#admonition-news-09
vim.loader.enable()

--- ヤンクをクリップボードに
vim.api.nvim_set_option('clipboard', 'unnamedplus')

-- VimScriptの文字コード（マルチバイト有効化）
vim.scriptencoding = "utf-8"

--- undoの永続化 ---
if vim.fn.has('persistent_undo') == 1 then
	local undo_path = vim.fn.expand("~/.cache/nvim/undo")	-- ~/を展開
	vim.opt.undodir = undo_path
	vim.opt.undofile = true									-- undoのfileを有効化
end

--- keymap ---
local map = vim.keymap.set
--[[ memo: 基本noremap、<Plug>時map、Lua関数可
	command_mode:      "c"
	insert_mode:       "i"
	normal_mode:       "n"
	term_mode:         "t"
	visual_mode:       "v"
	visual_block_mode: "x" ]]

vim.g.mapleader = " "					-- リーダーキーを スペース に
vim.g.maplocalleader = " "				-- リーダーキーを スペース に
map("n", "<ESC><ESC>", ":noh<Return>")	-- Escキー をタブルクリックで、ハイライト削除
map({"i", "v", "x"}, "<C-c>", "yy")		-- C-c でコピー
map("n", "！", "!")						-- :wq！用
map("n", "っd", "dd")					-- 全角・半角間違い用
map("n", "っy", "yy")					-- 全角・半角間違い用
map("n", "うう", "uu")					-- 全角・半角間違い用

map("n", "<Leader>j", ":bnext<Return>")	-- 次のバッファに移動
map("n", "<Leader>k", ":bprev<Return>")	-- 前のバッファに移動
map({"i", "n"}, "<C-f>", "<C-x><C-o>")	-- オムニ補完






--[[
----- :Emo でデスクトップにmemo.txtを作成し、入力開始 -----
vim.api.nvim_create_user_command("Notepad", function(opts)
	vim.cmd("e " .. "/mnt/c/Users/yorugo/Desktop/memo.txt")
end, {})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "1packer_nvim.lua" },
	command = "PackerCompile",
})
]]
