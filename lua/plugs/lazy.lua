vim.loader.enable()

--[[ https://github.com/folke/lazy.nvim
init: 起動時に常に実行．
config: プラグインのロード時に実行．
        optsかconfig = trueが設定されていれば，
        自動的にrequire(MAIN).setup(opts)を実行．
build: プラグインがインストールまたは更新されたときに実行．
        文字列 は シェルコマンド．
        先頭 : は Neovimコマンド．
]]

-- defaults configuration --
-- https://coralpink.github.io/commentary/outro/lazy.html
local opts = {
	performance = {
		rtp = {
			disabled_plugins = { -- コメントアウトすると enabled ( !disable になる)
				"gzip", -- 圧縮されたファイルの編集
				"matchit", -- % キーの強化
				"matchparen", -- 括弧系のハイライト
				"netrwPlugin", -- ファイラ
				"tarPlugin", -- プラグインインストール時に tar 解答？
				"tohtml", -- vimdiff の HTML 化など
				"tutor", -- 対話型のチュートリアル
				"zipPlugin", -- プラグインインストール時に zip 解答？
			},
		},
	},
}

-- plugin configuration (Based on migration from packer.nvim) --
-- https://coralpink.github.io/commentary/outro/lazy-migration-guide.html
local plugins = {
	-- -- -- -- -- -- --
	-- -- 通常起動 -- --
	-- -- -- -- -- -- --
	{
		"dstein64/nvim-scrollview",
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
	{ "vim-jp/vimdoc-ja" },
	{ "wakatime/vim-wakatime" },
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
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
	{ "cohama/lexima.vim", lazy = true },
	{ "Eandrju/cellular-automaton.nvim", lazy = true, cmd = "CellularAutomaton" },
	-- Eandrju/cellular-automaton.nvim: keys = "<leader>r",
	{ "github/copilot.vim", lazy = true, build = ":Copilot setup", cmd = "Copilot" },
	{ "mattn/vim-maketable", lazy = true, cmd = { "MakeTable", "UnmakeTable" } },
	{ "neovim/nvim-lspconfig", lazy = true },
	{ "previm/previm", lazy = true, ft = "markdown" },
	-- previm/previm: dependencies = "tyru/open-browser.vim", -- wsl と相性悪し
	{ "skanehira/translate.vim", lazy = true, cmd = "Translate" },
	{ "tpope/vim-commentary", lazy = true, keys = { "gcc", "gc", "gcap" } },
	{
		"chomosuke/typst-preview.nvim",
		lazy = true,
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
	},
	{
		"mhartington/formatter.nvim",
		lazy = true,
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
	{
		"ray-x/go.nvim",
		lazy = true,
		dependencies = {
			-- optional packages
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

require("lazy").setup(plugins, opts)

local notes = {
	{
		"IogaMaster/neocord",
		lazy = true,
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
}

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
