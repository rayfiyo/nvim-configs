-- 公式ドキュメント: https://lazy.folke.io/spec
-- disabled_plugins の設定は vim_g.lua に
vim.loader.enable()
local opts = {
	defaults = { lazy = true }, -- デフォルトで lazy = treu
	performance = { cache = { enabled = true } }, -- キャッシュ有効化
}

-- plugin configuration (Based on migration from packer.nvim) --
-- https://coralpink.github.io/commentary/outro/lazy-migration-guide.html
local plugins = {
	-- -- -- -- -- -- --
	-- -- 通常起動 -- --
	-- -- -- -- -- -- --
	{
		"dstein64/nvim-scrollview",
		lazy = false,
		init = function()
			require("scrollview").setup({
				excluded_filetypes = { "nerdtree" },
				current_only = true,
				winblend = 100, -- 透過
				base = "buffer",
				column = 154,
				signs_on_startup = { "all" },
				diagnostics_severities = { vim.diagnostic.severity.ERROR },
			})
		end,
	},
	{
		--[[
        対応言語: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
        導入１: https://zenn.dev/duglaser/articles/c02d6a937a48df
		導入２: https://konnyakmannan.com/archives/neovim_treesitter_setup_on_windows11/
        メモ: プラグインマネージャーは関係ない `:TSInstallInfo`
        ]]
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true, additional_vim_regex_highlighting = true },
				indent = { enable = true },
				ensure_installed = {
					"bash",
					"bibtex",
					"c",
					"css",
					"dockerfile",
					"fish",
					"git_rebase",
					"go",
					"gomod",
					"gosum",
					"html",
					"json",
					"json5",
					"jsonc",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"toml",
					"typst",
					"yaml",
					"vim",
				},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		opts = {
			ensure_installed = {
				"ast-grep",
				"black",
				"clang-format",
				"clangd",
				"gofumpt",
				"gopls",
				"prettierd",
				"python-lsp-server",
				"stylua",
				"templ",
				"tinymist",
				"typescript-language-server",
				"typstfmt",
				"xmlformatter",
			},
		},
		init = function()
			-- "skip" はエラーを引き起こす
			require("mason").setup({ PATH = "prepend" })
		end,
	},

	-- -- -- -- -- -- --
	-- -- 遅延起動 -- --
	-- -- -- -- -- -- --
	{ "cohama/lexima.vim", keys = "i" },
	{ "Eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },
	-- Eandrju/cellular-automaton.nvim: keys = "<leader>r",
	{ "github/copilot.vim", build = ":Copilot setup", cmd = "Copilot" },
	{ "mattn/vim-maketable", cmd = { "MakeTable", "UnmakeTable" } },
	{ "neovim/nvim-lspconfig", keys = "i" },
	{ "previm/previm", ft = "markdown" },
	-- previm/previm: dependencies = "tyru/open-browser.vim", -- wsl と相性悪し
	{ "skanehira/translate.vim", cmd = "Translate" },
	{ "tpope/vim-commentary", keys = { "gcc", "gc", "gcap" } },
	{ "vim-jp/vimdoc-ja", keys = { "h", mode = "c" } },
	{ "wakatime/vim-wakatime", keys = "i" },
	{
		--[[
		"chomosuke/typst-preview.nvim",
		ft = "typst",
		version = "0.1.*",
		init = function()
			require("typst-preview").setup({
				open_cmd = '"/mnt/c/Program Files/Google/Chrome/Application/chrome.exe" %s',
				-- follow_cursor = false,
			})
		end,
		build = function()
			require("typst-preview").update()
		end,
        --]]
	},
	{
		"mhartington/formatter.nvim",
		cmd = {
			"Format",
			"FormatWrite",
		},
		build = function()
			vim.fn.system("mkdir -p\
            ~/.local/share/nvim/lazy/formatter.nvim/lua/formatter/filetypes/;\
            cp ~/.config/nvim/lua/plugs/bkup_formatter/filetypes/*.lua\
            ~/.local/share/nvim/lazy/formatter.nvim/lua/formatter/filetypes/")
		end,
	},
}

require("lazy").setup(plugins, opts)

local no_used = {
	{
		"IogaMaster/neocord",
		event = "VeryLazy",
		keys = { "<leader>d" },
		init = function()
			require("neocord").setup({
				-- https://github.com/IogaMaster/neocord?tab=readme-ov-file#lua
				-- 無効化はスペース２つ
				editing_text = "Editing now",
				file_explorer_text = "Browsing now",
				reading_text = "Reading now",
				workspace_text = "🦕💭",
				line_number_text = "Line %s out of %s",
			})
		end,
	},
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			-- "ray-x/guihua.lua",
			-- "neovim/nvim-lspconfig",
			-- "nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" }, -- これ起動遅くなるかも
		ft = { "go", "gomod" },
		-- if you need to install/update all binaries
		build = ':lua require("go.install").update_all_sync()',
	},
}

-- 公式ドキュメント: https://lazy.folke.io/spec

--[[ 説明
init: 起動時に常に実行．
    init = function() require("scrollview").setup{
        excluded_filetypes = {"nerdtree"},
    } end,
config: プラグインのロード時に実行
        opts か config = true が設定されていれば，
        自動的に require(MAIN).setup(opts) を実行
build: プラグインがインストールまたは更新されたときに実行
        文字列 は シェルコマンド
        先頭 : は Neovimコマンド
lazy: event, keys, cmd, ft のいずれかで発火する遅延に
]]

--[[ usage
キーマップ
    モード指定すると副作用あり -> 改善？
    特に，コマンドラインでの入力はキーマップと c モードで指定する
	keys = { "h", mode = "c" } },

１つの関数
    build = function() vim.cmd.GlowInstall() end,

複数の関数
    init = function()
        vim.keymap.set("x", "ga", "<Plug>(EasyAlign)")
        vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
    end,

イベント
    -- * "BufEnter" か "BufEnter *.lua" で指定
    event = {"FocusLost", "CursorHold"},

vim コマンド
    cmd = {":avim", ":bstart"},

依存
    dependencies = "repo",

ファイルタイプ
    ft = "go",

キーマップ
    keys = {"v", "<CR>"},
]]
