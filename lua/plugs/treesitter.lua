-- nvim-treesitter (syntax highlighting plugin) の設定
-- install: :TSInstall c css dockerfile fish go html json json5 jsonc markdown python rust help lua vim
-- info:    :TSInstallInfo
-- プラグインマネージャーは関係ない
-- 導入: https://zenn.dev/duglaser/articles/c02d6a937a48df
-- 公式: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true, -- syntax highlightを有効にする
		additional_vim_regex_highlighting = true, -- vモードは，デフォルトのシンタックスハイライト
	},
	indent = {
		enable = false,
	},
})
