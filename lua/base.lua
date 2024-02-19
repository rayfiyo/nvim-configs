-- "vim.opt.*" 以外の設定
-- https://zenn.dev/hisasann/articles/neovim-settings-to-lua

-- Luaファイルをバイトコンパイルしてキャッシュする
-- https://coralpink.github.io/commentary/outro/lazy.html#admonition-news-09
vim.loader.enable()

--- ヤンクをクリップボードに対応 ---
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- VimScriptの文字コード（マルチバイト有効化） ---
vim.scriptencoding = "utf-8"

--- undoの永続化 ---
if vim.fn.has("persistent_undo") == 1 then
	local undo_path = vim.fn.expand("~/.cache/nvim/undo") -- ~/を展開
	vim.opt.undodir = undo_path
	vim.opt.undofile = true -- undoのfileを有効化
end

--- python3のpath追加（clang-formatで必要） ---
vim.g.python3_host_prog = "/usr/bin/python3"

--- 終了時のカーソル位置を保存 ---
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})
