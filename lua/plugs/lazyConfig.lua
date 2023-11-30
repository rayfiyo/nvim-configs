-- defaults configuration
-- https://coralpink.github.io/commentary/outro/lazy.html
local opts = {
	performance = {
		rtp = {
			disabled_plugins = {
				-- コメントアウトすると enabled ( !disable になる)
				-- "gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				-- "tarPlugin",
				"tohtml",
				"tutor",
				-- "zipPlugin",
			},
		},
	},
}

-- plugin configuration ((Based on migration from packer.nvim))
-- https://coralpink.github.io/commentary/outro/lazy-migration-guide.html
local plugins = {
	-- 起動と同時
	{
		"dstein64/nvim-scrollview",
		init = function()
			require("scrollview").setup({
				excluded_filetypes = { "nerdtree" },
				current_only = true,
				winblend = 100, -- 透過
				base = "buffer",
				column = 130,
				signs_on_startup = { "all" },
				diagnostics_severities = { vim.diagnostic.severity.ERROR },
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = [[:TSInstall c css dockerfile fish go html json json5 jsonc markdown python rust help lua vim]],
	},
	{ "lewis6991/impatient.nvim" },
	{ "vim-jp/vimdoc-ja" },
	{ "wakatime/vim-wakatime" },
	{ "williamboman/mason.nvim" },

	-- 遅延
	{
		"Eandrju/cellular-automaton.nvim",
		lazy = true,
		cmd = "CellularAutomaton",
		keys = "<leader>r",
		--次に見たら削除 2023年10月30日
		--{"n", "<leader>r"},
		--{"v", "<leader>r"},
	},
	{ "github/copilot.vim", lazy = true, build = [[:Copilot setup]], cmd = "Copilot" },
	{ "mattn/vim-maketable", lazy = true, cmd = {
		"MakeTable",
		"UnmakeTable",
	} },
	{ "mhartington/formatter.nvim", lazy = true, keys = "<leader>f", cmd = {
		"Format",
		"FormatWrite",
	} },
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		--ft = "go",
		build = function()
			require("lspconfig").gopls.setup({})
		end,
	},
	{
		"previm/previm",
		lazy = true,
		cmd = "PrevimOpen",
		keys = "<C-p>",
		--次に見たら削除 2023年10月30日
		--{"n", "<C-p>"},
		--{"v", "<C-p>"},
		dependencies = "tyru/open-browser.vim",
	},
	{
		"skanehira/translate.vim",
		lazy = true,
		cmd = "Translate",
		keys = "<leader>t",
		--次に見たら削除 2023年10月30日
		--{"n", "<leader>t"},
		--{"v", "<leader>t"},
	},
	{
		"tyru/open-browser.vim",
		lazy = true,
		keys = "<leader><C-l>",
		--次に見たら削除 2023年10月30日
		--{"n", "<leader><C-l>"},
		--{"v", "<leader><C-l>"},
	},
}

require("lazy").setup(plugins, opts)

-- https://github.com/folke/lazy.nvim#-plugin-spec
--[[
= Lazy-load: If conditions match, run
== vim cmd
	cmd = {":avim", ":bstart"},
== event
	* "BufEnter" か "BufEnter *.lua" で指定
	event = {"FocusLost", "CursorHold"},
== filetype
	ft = "go",
== key mapping
	keys = {"v", "<CR>"},
== when the plugin loads (依存関係)
	dependencies = "repo",
== init: always executed during startup
	init = function() require("scrollview").setup{
		excluded_filetypes = {"nerdtree"},
	} end,
== build: when a plugin is installed or updated ]]
--	vim:  build = [[:GlowInstall]],
--	bash: build = [[npm install]],

--[[
= usage
== key mappings (モード指定すると副作用あり)
	keys = {
		{"n", "<CR>"},
		{"v", "<CR>"},
	},
= use a function
	build = function() vim.cmd.GlowInstall() end,
= use functions
	init = function()
		vim.keymap.set("x", "ga", "<Plug>(EasyAlign)")
		vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
	end,
]]
