-- 2023-01-24
-- https://qiita.com/delphinus/items/8160d884d415d7425fcc

vim.cmd.packadd "packer.nvim"
require("packer").startup(function()

--	= 初期起動(読み込み付き)
	use {"lewis6991/impatient.nvim"}

--	= 初期起動
	use {"neovim/nvim-lspconfig",
		run = function()
			require'lspconfig'.gopls.setup{}
		end,
	}
	use {"nvim-treesitter/nvim-treesitter",
		run = [[:TSInstall c css dockerfile fish go html json json5 jsonc markdown python rust help lua vim]],
	}
	use {"dstein64/nvim-scrollview",
		setup = function()
			require'scrollview'.setup{
				excluded_filetypes = {'nerdtree'},
				current_only = true,
				winblend = 100, -- 透過
				base = 'buffer',
				column = 130,
				signs_on_startup = {'all'},
				diagnostics_severities = {vim.diagnostic.severity.ERROR}
			}
		end,
	}
	use "vim-jp/vimdoc-ja"
	use "wakatime/vim-wakatime"

--	= 遅延
	use {"wbthomason/packer.nvim", opt = true,}
	use {"Eandrju/cellular-automaton.nvim",
		opt = true,
		cmd = {"CellularAutomaton"},
		keys = {	{ "n", "<leader>r" },
					{ "v", "<leader>r" },
		},
	}
	use {"mattn/vim-maketable",
		opt = true,
		cmd = {	"\'<,\'>MakeTable",
				"\'<,\'>MakeTable!",
				"\'<,\'>MakeTable",
		},
	}
	use {"previm/previm",
		opt = true,
		cmd = {"PrevimOpen"},
		keys = {	{ "n", "<C-p>" },
					{ "v", "<C-p>" },
		},
		requires ={"tyru/open-browser.vim"},
	}
	use {"tyru/open-browser.vim",
		opt = true,
		cmd = {"<Plug>(openbrowser-smart-search)"},
		keys = {	{ "n", "<Leader><C-l>" },
					{ "v", "<Leader><C-l>" },
		},
	}
	use {"skanehira/translate.vim",
		opt = true,
		cmd = {"Translate"},
		keys = {	{ "n", "<Leader>t" },
					{ "v", "<Leader>t" },
		},
	}
end)

--[[	= プラグインを読み込まない(読み込み条件を指定すれば省略可)::
			opt = true,

		= 特定の条件でプラグインを読み込むオプション
		* コマンド::
			cmd = {":avim", ":bstart"},
		* イベント::
			event = {"FocusLost", "CursorHold"},
		* ファイル::
			ft = { "go" },
		* キー::
			keys = {
				{ "n", "<CR>" },
				{ "v", "<CR>" },
			},
		* VimL関数::
			fn = { "Artify" }, 
		* 真の時(例はguiの時)::							]]
--			cond = [[vim.fn.has"gui" == 1]],

--		= run オプションで、インストール時・更新時に実行
--		* vimコマンド::
--			run = [[:GlowInstall]],
--		* bashコマンド::
--			run = [[npm install]],
--[[	* 関数::
--			run = function()
--				vim.cmd.GlowInstall()
--			end,

		= 依存関係のプラグインを読み込む
			requires = {"repo"},

		= プラグイン読み込み前に実行する関数
			このオプションのみのとき、特別に、非遅延読み込み(opt = true必須)。
			setup = function()
				vim.keymap.set("x", "ga", "<Plug>(EasyAlign)")
				vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
			end,

		= プラグイン読み込み後に実行する関数
			config = function()
				require("lspconfig").tsserver.setup {}
			end,										]]
