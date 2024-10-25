-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- フォーマッタは mhartington/formatter.nvim を使用（LSP不使用）

local lsp = require("lspconfig")
lsp.ast_grep.setup({}) -- プロジェクトルートに sgconfig.yml 必須
lsp.clangd.setup({})
lsp.gopls.setup({
	settings = {
		gopls = {
			staticcheck = true,
		},
	},
})
lsp.templ.setup({})
lsp.typst_lsp.setup({
	settings = {
		exportPdf = "onType", -- Choose onType, onSave or never.
		-- serverPath = "" -- Normally, there is no need to uncomment it.
	},
})
