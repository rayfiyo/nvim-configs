-- 2023-01-22
-- :call dein#install() でインストールすること。
-- ~/.config/nvim/deinに dein.toml
-- ~/.cache/dein にインストール
-- vim.fn と vim.call は、ほぼ同じ


vim.g.config_path = vim.fn.expand('~/.config')
vim.g.cache_path = vim.fn.expand('~/.cache')
local dein_dir = vim.g.cache_path .. '/dein'
local dein_file = dein_dir ..  '/repos/github.com/Shougo/dein.vim'
--[[	~/ を展開して let g:config_path = ~/.config
		~/ を展開して let g:cache_path = ~/.cache
		let s:dein_dir = ~/.cache/dein と同等
		let s:dein_file = ~/.cache/dein/repos/github.com/Shougo/dein.vim と同等
--]]


if not string.find(vim.api.nvim_get_option('runtimepath'), 'dein.vim') then
	if not (vim.fn.isdirectory(dein_file) == 1) then
		os.execute('git clone https://github.com/Shougo/dein.vim ' .. dein_file)
	end
	vim.api.nvim_set_option('runtimepath', dein_file .. ',' .. vim.api.nvim_get_option('runtimepath'))
end
--[[	if &runtimepath !~# '/dein.vim'
			if !isdirectory(s:dein_file)
				execute '!git clone https://github.com/Shougo/dein.vim' s:dein_file
			endif
			execute 'set runtimepath^=' . s:dein_file
		endif
--]]


if (vim.fn['dein#load_state'](dein_dir) == 1) then
	vim.fn['dein#begin'](dein_dir)
	local toml_dir = vim.g.config_path .. '/nvim/dein'
	vim.fn['dein#load_toml'](toml_dir .. '/dein.toml', { lazy = 0 })
	vim.fn['dein#load_toml'](toml_dir .. '/dein_lazy.toml', { lazy = 1 })
	vim.fn['dein#end']()
	vim.fn['dein#save_state']()
end
--[[	if dein#load_state(s:dein_dir)
			call dein#begin(s:dein_dir)
			let s:toml_dir = '~/.config/nvim/dein'
			let s:toml = s:toml_dir . '/dein.toml'				; call dein#load_toml(s:toml, {'lazy': 0})
			let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'	; call dein#load_toml(s:lazy_toml, {'lazy' : 1})
			call dein#end()
			call dein#save_state()
		endif
--]]


if (vim.fn['dein#check_install']() ~= 0) then
	vim.fn['dein#install']()
end
--[[	if dein#check_install()
		call dein#install()
		endif
--]]


local rm_plugins = vim.fn['dein#check_clean']()
if #rm_plugins > 0  == 1 then
	vim.fn[map](rm_plugins, "delete(v:val, 'rf')")
	vim.fn['dein#recache_runtimepath']()
end
--[[	let s:rm_plugins = dein#check_clean()
		if len(s:rm_plugins) > 0
			call map(s:rm_plugins, "delete(v:val, 'rf')")
			call dein#recache_runtimepath()
		endif
--]]


--[[	vim.cmd('filetype plugin indent on')
		vim.cmd('syntax on')

	--filetype plugin indent on
	--syntax enable
--]]