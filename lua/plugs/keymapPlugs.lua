--- keymap ---
local map = vim.keymap.set
--[[ memo: 基本noremap、<Plug>時map、Lua関数可
	command_mode:      "c"
	insert_mode:       "i"
	normal_mode:       "n"
	term_mode:         "t"
	visual_mode:       "v"
	visual_block_mode: "x" ]]
--- plugin keymap ---
-- CellularAutomaton
	map({"n", "v"}, "<Leader>m", ":CellularAutomaton make_it_rain<Return>")
-- open-browser.vim
	map({"n", "v"}, "<Leader><C-l>", "<Plug>(openbrowser-smart-search)")
-- previm
	map({"n", "v"}, "<C-p>", ":PrevimOpen<Return>")
-- translate.vim
	map({"n", "v"}, "<Leader>t", ":Translate<Return>")
