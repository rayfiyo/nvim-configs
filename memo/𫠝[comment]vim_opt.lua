-- 2023-01-22
-- vim.opt.* の設定
-- https://zenn.dev/hisasann/articles/neovim-settings-to-lua

local options = {
	encoding = "utf-8",
	fileencoding = "utf-8",
	fileencodings = "utf-8,utf-16",
	fileformats = "unix,dos,mac",

	number = true,
	shiftwidth = 4,
	smartindent  = true,
	tabstop = 4,

	cursorline = true	,
	ruler = true,

	hlsearch = true,
	incsearch = true,
	showcmd = true,

	splitbelow = true,
	splitright = false,

	clipboard = "unnamedplus",
	swapfile = false,
}
for k, v in pairs(options) do
	vim.opt[k] = v
end

--[[	* バッファで表示する文字コード
	* 保存する文字コード
	* 読み込む文字コード utf-8 -> utf-16
	* 改行コード unix -> dos -> mac

	* 行番号表示
	* インデントの増減もスペース4文字に
	* スマートインデントを行う
	* インデントの表示をスペース4文字に

	* カーソルハイライト
	* カーソルの位置表示


	* 検索ハイライトを有効化
	* インクリメントサーチ(入力しながら検索)
	* 入力中のコマンドをステータスに表示

	* 水平分割時、下(below)に表示
	* 縦分割時、左(no right)に表示

	* yank&put に、クリップボードを利用
	* swapfileを作らない							]]

--[[	vim.opt.equalalways = false
	vim.opt.undofile = false
	vim.opt.laststatus = 2
	vim.opt.wildmenu = true

	* -- 分割時に自動調整を無効化(デフォルトtrue)
	* -- スタートライン表示(デフォルト2)
	* -- undofileを作らない(デフォルトtrue)
	* -- コマンドモードの補完(デフォルトtrue)		]]