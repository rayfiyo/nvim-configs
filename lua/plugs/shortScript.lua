-- 日本語化プラグインの設定
vim.opt.helplang = ja

-- 保存時にフォーマット
-- https://zenn.dev/knsh14/articles/nvim-gopls-2021-01-16
vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*',
	callback = function() vim.lsp.buf.format { async = true } end
})

-- previm/previm
-- autocmd BufRead,BufNewFile *.{text,txt,md} vim.opt.filetype=markdown

-- williamboman/mason.nvim
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})




--[[ 設定だるかったので消したフォーマッタ
-- mhartington/formatter.nvim の書き込み時に自動フォーマット
-- https://github.com/mhartington/formatter.nvim#format-after-save
-- https://uhoho.hatenablog.jp/entry/2023/05/18/063603
vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
vim.api.nvim_create_autocmd({"BufWritePost"}, {
  pattern = "*",
  group = "FormatAutogroup",
  command = "FormatWrite",
})
]]
