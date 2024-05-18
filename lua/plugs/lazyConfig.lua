-- Luaファイルをバイトコンパイルしてキャッシュする
-- https://coralpink.github.io/commentary/outro/lazy.html#admonition-news-09
vim.loader.enable()

-- defaults configuration --
-- https://coralpink.github.io/commentary/outro/lazy.html
local opts = {
	performance = {
		rtp = {
			disabled_plugins = {
				-- コメントアウトすると enabled ( !disable になる)
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
}

-- plugin configuration (Based on migration from packer.nvim) --
-- https://coralpink.github.io/commentary/outro/lazy-migration-guide.html
local plugins = {
	--------------------------------------------------------
	----------------------- 通常起動 -----------------------
	--------------------------------------------------------
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
		-- https://zenn.dev/duglaser/articles/c02d6a937a48df
		-- https://konnyakmannan.com/archives/neovim_treesitter_setup_on_windows11/
		-- 対応言語: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
		-- :TSInstall bash c css dockerfile fish go html json json5 jsonc markdown lua vim
		"nvim-treesitter/nvim-treesitter",

		build = ":TSUpdate",

		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = false,
				highlight = {
					enable = true,

					-- vモードは，デフォルトのシンタックスハイライト
					additional_vim_regex_highlighting = true,
				},
			})
		end,
	},
	{
		"lewis6991/impatient.nvim",
	},
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	{
		"vim-jp/vimdoc-ja",
	},
	{
		"wakatime/vim-wakatime",
	},
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		init = function()
			require("mason").setup({
				PATH = "prepend", -- "skip" seems to cause the spawning error
			})
		end,
	},

	--------------------------------------------------------
	----------------------- 遅延起動 -----------------------
	--------------------------------------------------------
	{
		"chomosuke/typst-preview.nvim",
		lazy = true,
		ft = "typst",
		version = "0.1.*",
		init = function()
			require("typst-preview").setup({
				open_cmd = '"/mnt/c/Program Files/Google/Chrome/Application/chrome.exe" %s',
			})
		end,
		build = function()
			require("typst-preview").update()
		end,
	},
	{
		"Eandrju/cellular-automaton.nvim",
		lazy = true,
		cmd = "CellularAutomaton",
		--keys = "<leader>r",
	},
	{
		"github/copilot.vim",
		lazy = true,
		build = [[:Copilot setup]],
		cmd = "Copilot",
	},
	{
		"mattn/vim-maketable",
		lazy = true,
		cmd = {
			"MakeTable",
			"UnmakeTable",
		},
	},
	{
		"mhartington/formatter.nvim",
		lazy = true,
		cmd = {
			"Format",
			"FormatWrite",
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = true,
	},
	{
		"previm/previm",
		lazy = true,
		ft = "markdown",
		dependencies = "tyru/open-browser.vim",
	},
	{
		"skanehira/translate.vim",
		lazy = true,
		cmd = "Translate",
	},
	{
		"tpope/vim-commentary",
		lazy = true,
		keys = { "gcc", "gc", "gcap" },
	},
}

require("lazy").setup(plugins, opts)

-- https://github.com/folke/lazy.nvim#-plugin-spec
--[[

key は指定すると失敗するかも！！

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
--    vim:  build = [[:GlowInstall]],
--    bash: build = [[npm install]],

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
