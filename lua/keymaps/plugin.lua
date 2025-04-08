-- plugin 依存 --
local map = vim.keymap.set

-- プレビュープラグインの起動
map({ "n", "v" }, "<leader>o", function()
	if vim.bo.filetype == "typst" then
		-- chomosuke/typst-preview.nvim
		vim.cmd("update")
		vim.cmd("silent !pwsh.exe -c ./%:r.pdf >/dev/null 2>/dev/null")
	elseif vim.bo.filetype == "markdown" then
		-- previm/previm
		vim.cmd("update")
		vim.cmd("PrevimOpen")
	end
end, { silent = true })

-- Eandrju/cellular-automaton.nvim
map({ "n", "v" }, "<leader>m", "<cmd>CellularAutomaton make_it_rain<CR>")

-- github/copilot.vim
map({ "n", "v" }, "<leader>c", "<cmd>Copilot auth<CR>")

-- mhartington/formatter.nvim
-- map({ "n", "v" }, "<leader>f", "<cmd>Format<CR>")

-- skanehira/translate.vim
map({ "n", "v" }, "<leader>t", "<cmd>Translate<CR>")

-- tpope/vim-commentary
map({ "n", "v", "i" }, "<C-_>", "gcc", { remap = true })

-- tyru/open-browser.vim
-- map({ "n", "v" }, "<leader><C-l>", "<Plug>(openbrowser-smart-search)")
