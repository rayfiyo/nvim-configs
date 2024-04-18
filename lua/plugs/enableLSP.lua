-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- フォーマッタは mhartington/formatter.nvim を使用（LSP不使用）

local lsp = require("lspconfig")
lsp.clangd.setup({})
lsp.gopls.setup({})
lsp.texlab.setup({})
lsp.html.setup({})

-- lsp..setup{}
