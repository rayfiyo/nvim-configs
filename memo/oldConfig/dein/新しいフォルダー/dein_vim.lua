-- 2023-01-22
-- :call dein#install() でインストールすること。
-- ~/.config/nvim/deinに dein.toml
-- ~/.cache/dein にインストール

vim.g.config_path = vim.fn.expand('~/.config')
vim.g.cache_path = vim.fn.expand('~/.cache')
local dein_dir = vim.g.cache_path .. '/dein'
local dein_file = dein_dir ..  '/repos/github.com/Shougo/dein.vim'

if not string.find(vim.api.nvim_get_option('runtimepath'), 'dein.vim') then
	if not (vim.fn.isdirectory(dein_file) == 1) then
		os.execute('git clone https://github.com/Shougo/dein.vim ' .. dein_file)
	end
	vim.api.nvim_set_option('runtimepath', dein_file .. ',' .. vim.api.nvim_get_option('runtimepath'))
end

if (vim.fn['dein#load_state'](dein_dir) == 1) then
	vim.fn['dein#begin'](dein_dir)
	local toml_dir = vim.g.config_path .. '/nvim/dein'
	vim.fn['dein#load_toml'](toml_dir .. '/dein.toml', { lazy = 0 })
	vim.fn['dein#load_toml'](toml_dir .. '/dein_lazy.toml', { lazy = 1 })
	vim.fn['dein#end']()
	vim.fn['dein#save_state']()
end

if (vim.fn['dein#check_install']() ~= 0) then
	vim.fn['dein#install']()
end

local rm_plugins = vim.fn['dein#check_clean']()
if #rm_plugins > 0  == 1 then
	vim.fn[map](rm_plugins, "delete(v:val, 'rf')")
	vim.fn['dein#recache_runtimepath']()
end