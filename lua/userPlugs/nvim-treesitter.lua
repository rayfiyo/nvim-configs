-- nvim-treesitter(シンタックスハイライト プラグイン)
-- 次でインストール::	:TSInstall c css dockerfile fish go html json json5 jsonc markdown python rust help lua vim
-- インストール情報::	:TSInstallInfo
-- 導入 https://zenn.dev/duglaser/articles/c02d6a937a48df
-- 公式 https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,  -- syntax highlightを有効にする
		additional_vim_regex_highlighting = true,
	},
	indent = {
	enable = true,
	}
}