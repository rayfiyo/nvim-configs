-- https://github.com/mhartington/formatter.nvim#configure
-- ~/.local/share/nvim/lazy/formatter.nvim/lua/formatter/default

-- 設定（configurations）生成ユーティリティ
local util = require("formatter.util")

-- Format, FormatWrite, FormatLock, FormatWriteLock のコマンドを提供
require("formatter").setup({
	-- ログの設定
	logging = true,
	log_level = vim.log.levels.WARN,

	-- すべてのフォーマッタ設定はオプトイン（書かないとならない）
	-- Mason で インストールして，こちらでファイルタイプと紐づけ
	filetype = {

		-- prettierd 以外
		c = { require("formatter.filetypes.c").clangformat },
		go = { require("formatter.filetypes.go").gofumpt },
		lua = { require("formatter.filetypes.lua").stylua },
		latex = {
			require("formatter.filetypes.latex").latexindent,
			require("formatter.filetypes.tex").latexindent,
		},
		yaml = { require("formatter.filetypes.yaml").yamlfmt },

		-- prettierd 使う
		css = { require("formatter.filetypes.css").prettierd },
		graphql = { require("formatter.filetypes.graphql").prettierd },
		html = { require("formatter.filetypes.html").prettierd },
		json = { require("formatter.filetypes.json").prettierd },
		javascript = { require("formatter.filetypes.javascript").prettierd },
		markdown = { require("formatter.filetypes.markdown").prettierd },
		typescript = { require("formatter.filetypes.typescript").prettierd },
		vue = { require("formatter.filetypes.vue").prettierd },

		-- その他
		-- ["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
	},
})

-- prettierd but not support for atter.vim
-- https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
-- angular = { require("formatter.filetypes.angular").prettierd },
-- flow = { require("formatter.filetypes.flow").prettierd },
-- jsx = { require("formatter.filetypes.jsx").prettierd },
-- less = { require("formatter.filetypes.less").prettierd },
-- scss = { require("formatter.filetypes.scss").prettierd },
