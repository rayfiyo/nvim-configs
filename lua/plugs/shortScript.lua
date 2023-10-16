-- 日本語化プラグインの設定
vim.opt.helplang = ja

-- 保存時に goimports でフォーマット
-- https://zenn.dev/knsh14/articles/nvim-gopls-2021-01-16
vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*.go',
	callback = function() vim.lsp.buf.format { async = true } end
})

-- Goの補完
-- https://zenn.dev/knsh14/articles/nvim-gopls-2021-01-16
-- Enable completion triggered by <c-x><c-o>
local on_attach = function(client, bufnr) vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc') end
require('lspconfig').gopls.setup({on_attach = on_attach})

-- Previm
-- autocmd BufRead,BufNewFile *.{text,txt,md} vim.opt.filetype=markdown
