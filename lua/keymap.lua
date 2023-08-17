local map = vim.keymap.set						-- 基本noremap、<Plug>時map、Lua関数可

--[[ memo	* command_mode: "c"
		* insert_mode: "i"
		* normal_mode: "n"
		* term_mode: "t"
		* visual_mode: "v"
		* visual_block_mode: "x" ]]

-- vanilla keymap   --
vim.g.mapleader = " "							-- リーダーキーを スペース に
vim.g.maplocalleader = " "						-- リーダーキーを スペース に
map("n", "<ESC><ESC>", ":nohlsearch<Return>")	-- Escキー をタブルクリックで、ハイライト削除
map({"v", "x"}, "<C-c>", "\"*yy")				-- C-c でコピー
map("n", "<Leader>j", ":bnext<Return>")			-- ctrl+shift+j 次のバッファに移動する
map("n", "<Leader>k", ":bprev<Return>")			-- ctrl+shift+k 前のバッファに移動する
map({"n", "i"}, "<C-f>", "<C-x><C-o>")			-- ctrl+f オムニ補完

--	plugin keymap	--
-- = CellularAutomaton
	map({"n", "v"}, "<Leader>m", ":CellularAutomaton make_it_rain<Return>")
-- = open-browser.vim
	map({"n", "v"}, "<Leader><C-l>", "<Plug>(openbrowser-smart-search)")
-- = previm
	map({"n", "v"}, "<C-p>", ":PrevimOpen<Return>")
-- = translate.vim
	map({"n", "v"}, "<Leader>T", ":Translate<Return>")
