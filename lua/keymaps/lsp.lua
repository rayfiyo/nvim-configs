-- LSP依存 --
local map = vim.keymap.set

local lsp_opts = { noremap = true, silent = true }
map("n", "<leader>e", vim.diagnostic.open_float, lsp_opts)
map("n", "[d", vim.diagnostic.goto_prev, lsp_opts)
map("n", "]d", vim.diagnostic.goto_next, lsp_opts)

map("n", "<Leader>j", "<cmd>bnext<CR>") -- 次のバッファに移動
map("n", "<Leader>k", "<cmd>bprev<CR>") -- 前のバッファに移動
map({ "i", "n" }, "<C-f>", "<C-x><C-o>") -- オムニ補完

-- フォーマット（mhartington/formatter.nvim がなければ LSP）
map({ "n", "v" }, "<leader>f", function()
	local config = require("formatter.config").values.filetype
	-- ファイルタイプに応じてフォーマッタの切り替え
	-- if vim.bo.filetype == "javascriptreact" then
	-- vim.cmd("update")
	-- 現在のファイルタイプの formatter.config が存在しない（nil）か
	if config[vim.bo.filetype] == nil then
		vim.lsp.buf.format({ async = true })
	else
		vim.cmd("Format")
	end
end, { silent = true })
