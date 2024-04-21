-- 日本語化プラグインの設定
vim.opt.helplang = ja

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- mhartington/formatter.nvim の書き込み時に自動フォーマット
-- https://github.com/mhartington/formatter.nvim#format-after-save
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

-- williamboman/mason.nvim の ui 変更
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- previm/previm ファイル開く度に立ち上がるのが意外と不便だったので廃止
-- autocmd BufRead,BufNewFile *.{text,txt,md} vim.opt.filetype=markdown
--[[
autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.text", "*.txt", "*.md" },
	command = ":PrevimOpen",
})
]]
