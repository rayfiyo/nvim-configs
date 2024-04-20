local lsp = require("lspconfig")
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- https://github.com/neovim/nvim-lspconfig#suggested-configuration
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
-- https://alpacat.com/blog/nvim-lspconfig-key-mappings/
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

		-- mhartington/formatter.nvim 導入に伴い廃止 2023年12月16日
		-- vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)
	end,
})

-- https://zenn.dev/knsh14/articles/nvim-gopls-2021-01-16
--[[local opts = { noremap=true, silent=true }
エラーメッセージをフロート画面で表示
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
前のエラー
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
次のエラー
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
]]

--[[local on_attach = function(client, bufnr)
Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

Mappings
* See `:help vim.lsp.*` for documentation on any of the below functions
--
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
--
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
定義ジャンプ
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
メソッドの引数や返り値をホバー
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
実装ジャンプ(インターフェースを使っていない場合は定義ジャンプと同じ)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
シグネチャヘルプ
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workleader_folder, bufopts)
--
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workleader_folder, bufopts)
--
    vim.keymap.set('n', '<leader>wl', function()
--
    print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
        end, bufopts)
定義ジャンプ(型)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
--
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
--
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
メソッド/クラス/型 などの参照
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
フォーマット
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end
]]

--[[ 廃止したon_attach - 2023年10月30日
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set({'n', 'v'}, '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('lspconfig')['gopls'].setup{
    on_attach = on_attach,
    --flags = lsp_flags,
}
]]
