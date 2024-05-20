-- "vim.opt.*" 以外の設定

----------------------
------- keymap -------
----------------------
--[[noremap: 標準，map: <Plug>，非noremap: {remap = true}
    command_mode: "c"   insert_mode:       "i"
    normal_mode:  "n"   term_mode:         "t"
    visual_mode:  "v"   visual_block_mode: "x" ]]
local map = vim.keymap.set
vim.g.mapleader = " " -- リーダーキーを スペース に
vim.g.maplocalleader = " " -- リーダーキーを スペース に
map("n", "<ESC><ESC>", "<cmd>noh<CR>") -- Escキー をタブルクリックで、ハイライト削除
map("n", "！", "!") -- <cmd>wq！用
map("n", "っd", "dd") -- 全角・半角間違い用
map("n", "っy", "yy") -- 全角・半角間違い用
map("n", "うう", "uu") -- 全角・半角間違い用
map({ "n", "i" }, "<F5>", "<Esc>:w<CR>:!go run %<CR>")

----------------------
--- キーマップ以外 ---
----------------------
-- https://zenn.dev/hisasann/articles/neovim-settings-to-lua

-- ヤンクをクリップボードに対応
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- VimScriptの文字コード（マルチバイト有効化）
vim.scriptencoding = "utf-8"

-- undoの永続化
if vim.fn.has("persistent_undo") == 1 then
	vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undo") -- ~/ を展開
	vim.opt.undofile = true -- undoのfileを有効化
end

-- 終了時のカーソル位置を保存
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

-- python3のpath追加（clang-formatで必要）
vim.g.python3_host_prog = "/usr/bin/python3"

-- .typst の filetype を sql ではなく typst として認識
vim.filetype.add({
	extension = {
		typ = "typst",
	},
})
