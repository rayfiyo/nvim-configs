local g = {
	-- 高速化
	-- https://zenn.dev/kawarimidoll/articles/8172a4c29a6653
	did_install_default_menus = 1,
	did_install_syntax_menu = 1,
	did_indent_on = 1,
	did_load_filetypes = 1,
	did_load_ftplugin = 1,
	loaded_2html_plugin = 1, -- vimdiff の HTML 化など
	loaded_gzip = 1, -- 圧縮されたファイルの編集
	loaded_man = 1,
	loaded_matchit = 1, -- % キーの強化
	loaded_matchparen = 1, -- 括弧系のハイライト
	loaded_netrwPlugin = 1, -- ファイラ
	loaded_remote_plugins = 1,
	loaded_shada_plugin = 1,
	loaded_spellfile_plugin = 1,
	loaded_tarPlugin = 1, -- プラグインインストール時に tar 解答？
	loaded_tutor_mode_plugin = 1, -- 対話型のチュートリアル
	loaded_zipPlugin = 1, -- プラグインインストール時に zip 解答？
	skip_loading_mswin = 1,
}

for i, v in pairs(g) do
	vim.g[i] = v
end
