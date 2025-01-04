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

-- tpope/vim-commentary が Typst でも動作するように設定
autocmd("FileType", {
	command = "",
	vim.opt_local.commentstring:append("// %s"),
})

-- previm/previm の設定
vim.g.previm_open_cmd = "vivaldi.exe"
vim.g.previm_wsl_mode = "1"

-- previm/previm ファイル開く度に立ち上がるのが意外と不便だったので廃止
-- autocmd BufRead,BufNewFile *.{text,txt,md} vim.opt.filetype=markdown
--[[
autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.text", "*.txt", "*.md" },
	command = ":PrevimOpen",
})
]]
