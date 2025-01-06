-- 0 で有効化，紛らわしいので加えてコメントアウトも
-- 1 で無効化

local g = {
	-- 高速化
	-- https://zenn.dev/kawarimidoll/articles/8172a4c29a6653
	did_install_default_menus = 1,
	-- did_install_syntax_menu = 0, -- matchparen 有効化のため
	did_indent_on = 1,
	did_load_ftplugin = 1,
	-- did_load_filetypes = 0, -- lsp が動作しなくなる

	-- https://coralpink.github.io/commentary/outro/lazy.html
	-- disabled_plugins の設定 含む
	loaded_2html_plugin = 1, -- ファイルをHTML形式に変換するプラグイン
	loaded_gzip = 1, -- Gzip圧縮ファイルの編集
	loaded_man = 1, -- マニュアルページを表示する
	loaded_matchit = 1, -- % キーの強化
	-- loaded_matchparen = 0, -- 括弧系のハイライト
	loaded_netrwPlugin = 1, -- ファイルブラウザ機能
	loaded_remote_plugins = 1, -- リモートプラグイン（PythonやRubyのインターフェース）
	loaded_shada_plugin = 1, -- セッションデータ管理用のプラグイン
	loaded_spellfile_plugin = 1, -- スペルチェック関連のプラグイン
	loaded_tarPlugin = 1, -- TARアーカイブファイルを扱うプラグイン
	loaded_tutor_mode_plugin = 1, -- 対話型のチュートリアル
	loaded_zipPlugin = 1, -- ZIPアーカイブファイルを扱うプラグイン
	skip_loading_mswin = 1, -- Windows向け設定を無効化
}

for i, v in pairs(g) do
	vim.g[i] = v
end
