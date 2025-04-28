-- 公式ドキュメント: https://lazy.folke.io/spec
-- disabled_plugins の設定は vim_g.lua に
vim.loader.enable()
local opts = {
	defaults = { lazy = true }, -- デフォルトで lazy = treu
	performance = { cache = { enabled = true } }, -- キャッシュ有効化
}
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- plugin configuration (Based on migration from packer.nvim) --
-- https://coralpink.github.io/commentary/outro/lazy-migration-guide.html
local plugins = {
	-- -- -- -- -- -- --
	-- -- 通常起動 -- --
	-- -- -- -- -- -- --
	{
		"mhartington/formatter.nvim",
		lazy = false, -- 別ファイルで require() しているので lazy = false
		keys = "<leader>f",
		cmd = { "Format", "FormatWrite" },
		build = function()
			vim.fn.system("mkdir -p\
            ~/.local/share/nvim/lazy/formatter.nvim/lua/formatter/filetypes/;\
            cp ~/.config/nvim/lua/plugs/bkup_formatter/filetypes/*.lua\
            ~/.local/share/nvim/lazy/formatter.nvim/lua/formatter/filetypes/")
		end,
		init = function()
			-- mhartington/formatter.nvim の書き込み時に自動フォーマット
			-- https://github.com/mhartington/formatter.nvim#format-after-save
			augroup("__formatter__", { clear = true })
			autocmd("BufWritePost", {
				group = "__formatter__",
				command = ":FormatWrite",
			})
		end,
	},
	{ "neovim/nvim-lspconfig", lazy = false, evnet = "InsertEnte" }, -- 別で require()
	{
		"williamboman/mason.nvim",
		lazy = false, -- 遅延させたほうが早い
		-- 依存され: "williamboman/mason-lspconfig.nvim"
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
	},

	-- -- -- -- -- -- --
	-- -- 遅延起動 -- --
	-- -- -- -- -- -- --
	{ "cohama/lexima.vim", event = "InsertEnter" },
	{ "Eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" }, -- "<leader>r",
	{ "github/copilot.vim", build = ":Copilot setup", cmd = "Copilot" },
	{ "mattn/vim-maketable", cmd = { "MakeTable", "UnmakeTable" } },
	{ "skanehira/translate.vim", cmd = "Translate" },
	{ "wakatime/vim-wakatime", event = "VeryLazy" },
	{ "williamboman/mason-lspconfig.nvim" }, -- 依存先: williamboman/mason.nvim
	{
		"cohama/lexima.vim",
		event = "InsertEnter",
		config = function()
			-- （）の設定
			vim.fn["lexima#add_rule"]({
				char = "（",
				input_after = "）",
			})
			vim.fn["lexima#add_rule"]({
				char = "）",
				at = [[\%#）]],
				leave = 1,
			})

            -- 「」の設定
			vim.fn["lexima#add_rule"]({
				char = "「",
				input_after = "」",
			})
			vim.fn["lexima#add_rule"]({
				char = "」",
				at = [[\%#）]],
				leave = 1,
			})

			-- $ の設定
			vim.fn["lexima#add_rule"]({
				char = "$",
				input_after = "$",
			})
		end,
	},
	{
		"dstein64/nvim-scrollview",
		event = "VeryLazy",
		init = function()
			vim.g.scrollview_excluded_filetypes = { "nerdtree" }
			vim.g.scrollview_current_only = true
			vim.g.scrollview_winblend = 100 -- 透過
			vim.g.scrollview_base = "buffer"
			vim.g.scrollview_column = 176
			vim.g.scrollview_signs_on_startup = { "all" }
			vim.g.scrollview_diagnostics_severities = { vim.diagnostic.severity.ERROR }
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
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true, additional_vim_regex_highlighting = true },
				indent = { enable = true },
				ensure_installed = {
					"bash",
					"bibtex",
					"c",
					"cpp",
					"css",
					"csv",
					"dockerfile",
					"fish",
					"git_config",
					"git_rebase",
					"gitcommit",
					"gitignore",
					"go",
					"gomod",
					"gosum",
					"html",
					"javascript",
					"json",
					"json5",
					"jsonc",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"sql",
					"toml",
					"tsx",
					"typescript",
					"typst",
					"yaml",
					"vim",
				},
			})
		end,
	},
	{
		"previm/previm",
		ft = "markdown", -- key や cmd だとうまく動作しない
		init = function()
			vim.g.previm_open_cmd = "vivaldi.exe"
			vim.g.previm_wsl_mode = "1"

			--[[
            -- previm/previm ファイル開く度に立ち上がるのが意外と不便だったので廃止
            -- autocmd BufRead,BufNewFile *.{text,txt,md} vim.opt.filetype=markdown
			autocmd({ "BufRead", "BufNewFile" }, {
				once = true,
				pattern = { "*.text", "*.txt", "*.md" },
				command = ":PrevimOpen",
			})
            ]]
		end,
	},
	{
		"tpope/vim-commentary",
		keys = { "gcc", "gc", "gcap" },
		init = function()
			-- tpope/vim-commentary が Typst でも動作するように設定
			autocmd("FileType", {
				once = true,
				pattern = "typst",
				command = "",
				vim.opt_local.commentstring:append("// %s"),
			})
		end,
	},
	{
		"vim-jp/vimdoc-ja",
		keys = { "h", mode = "c" },
		init = function()
			-- 日本語化プラグインの設定
			vim.opt.helplang = ja
		end,
	},
}

require("lazy").setup(plugins, opts)

local no_used = {
	{
		"chomosuke/typst-preview.nvim",
		ft = "typst",
		init = function()
			require("typst-preview").setup({
				open_cmd = '"/mnt/c/Users/yorugo/AppData/Local/Vivaldi/Application/vivaldi.exe" %s',
				-- open_cmd = '"/mnt/c/Program Files/Google/Chrome/Application/chrome.exe" %s',
				-- follow_cursor = false,
			})
		end,
	},
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
	{ "tyru/open-browser.vim" }, -- previm/previm の依存，wsl と相性が悪いので採用なし
	{
		"ray-x/go.nvim",
		dependencies = {
			-- optional packages, dependencies に記述は非推奨
			-- "ray-x/guihua.lua",
			-- "neovim/nvim-lspconfig",
			-- "nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		-- if you need to install/update all binaries
		build = ':lua require("go.install").update_all_sync()',
	},
}

-- 公式ドキュメント: https://lazy.folke.io/spec

--[[ 説明
init: （neovim の？）起動時に常に実行， vim.g.* の設定に役立つ
    init = function() require("scrollview").setup{
        excluded_filetypes = {"nerdtree"},
    } end,
config: プラグインのロード時に実行
        opts か config = true が設定されていれば，
        自動的に require(MAIN).setup(opts) を実行
build: プラグインがインストールまたは更新されたときに実行
        文字列 は シェルコマンド
        先頭 : は Neovimコマンド
lazy: event, keys, cmd, ft, require() のいずれかで発火する遅延に
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
    -- "VeryLazy" Neovim の起動後にアイドル状態で発火 lazy.nvim 独自
    -- https://vim-jp.org/vimdoc-ja/autocmd.html
    event = {"FocusLost", "CursorHold"},

vim コマンド
    cmd = {":avim", ":bstart"},

依存（おそらく非推奨）
    dependencies = "repo",

ファイルタイプ
    ft = "go",

キーマップ
    keys = {"v", "<CR>"},
]]
