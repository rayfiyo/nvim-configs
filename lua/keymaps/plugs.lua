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

local map = vim.keymap.set

---------
-- LSP --
---------
map("n", "<Leader>j", "<cmd>bnext<CR>") -- 次のバッファに移動
map("n", "<Leader>k", "<cmd>bprev<CR>") -- 前のバッファに移動
map({ "i", "n" }, "<C-f>", "<C-x><C-o>") -- オムニ補完
map( -- フォーマット（mhartington/formatter.nvim で失敗したら LSP）
	{ "n", "v" },
	"<leader>f",
	function()
		local formatter_ok, _ = pcall(vim.cmd, "Format")
		if not formatter_ok then
			vim.lsp.buf.format({ async = true })
		end
	end,
	{ silent = true }
)

-------------------
-- plugin keymap --
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
