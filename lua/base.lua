-- "vim.opt.*" 以外の設定
-- https://zenn.dev/hisasann/articles/neovim-settings-to-lua

local autocmd = vim.api.nvim_create_autocmd

-- 読み込みが遅いので autocmd で遅延
autocmd("ModeChanged", {
	once = true,
	callback = function()
		-- ヤンクをクリップボードに対応
		vim.api.nvim_set_option("clipboard", "unnamedplus")
	end,
})

-- VimScriptの文字コード（マルチバイト有効化）
-- vim.opt と重複してそう
-- vim.scriptencoding = "utf-8"

-- undoの永続化
if vim.fn.has("persistent_undo") == 1 then
	vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undo") -- ~/ を展開
	vim.opt.undofile = true -- undoのfileを有効化
end

-- 終了時のカーソル位置を保存
autocmd("BufReadPost", {
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
