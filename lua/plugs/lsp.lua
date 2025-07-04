-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- ~/.local/share/nvim/lazy/nvim-lspconfig/lua/lspconfig/configs
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
lsp.pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = { enabled = false },
				flake8 = { enabled = true },
				-- enabled = true,
				-- maxLineLength = 88,
				-- ignore = { "E203" },
			},
		},
	},
})
lsp.templ.setup({})
lsp.ts_ls.setup({})
lsp.tinymist.setup({
	settings = {
		exportPdf = "onType",
		fontPaths = "/usr/share/fonts/",
	},
})
--[[
lsp.typst_lsp.setup({
	settings = {
		exportPdf = "onType", -- Choose onType, onSave or never.
		-- serverPath = "" -- Normally, there is no need to uncomment it.
	},
})
]]
