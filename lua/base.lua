-- 2023-01-22
-- Config without "vim.opt.*"
-- https://zenn.dev/hisasann/articles/neovim-settings-to-lua

-- VimScriptの文字コード(マルチバイト文字の利用を有効化)
vim.scriptencoding = "utf-8"

----- :Emo でデスクトップにmemo.txtを作成し、入力開始 -----
vim.api.nvim_create_user_command("Notepad", function(opts)
	vim.cmd("e " .. "/mnt/c/Users/yorugo/Desktop/memo.txt")
end, {})

----- undoの永続化 -----
if vim.fn.has('persistent_undo') == 1 then
	local undo_path = vim.fn.expand("~/.cache/nvim/undo")	-- ~/を展開
	vim.opt.undodir = undo_path
	vim.opt.undofile = true								-- undoのfileを有効化
end

----- packer.vimのautocmd -----
vim.api.nvim_create_user_command("PackerAll", function(opts)
	vim.cmd("PackerInstall")
	vim.cmd("PackerSync")
	vim.cmd("PackerCompile")
end, {})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "1packer_nvim.lua" },
	command = "PackerCompile",
})

--[[ vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "1packer_nvim.lua" },
	command = "PackerCompile",
}) ]]
