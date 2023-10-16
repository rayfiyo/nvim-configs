--[[require("packer").startup(function()
--[[	 = 読み込まない(読み込み条件を指定すれば省略可)::
			opt = true,

		= 特定の条件で読み込むオプション
		* コマンド::
			cmd = {"avim", "bstart"},
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
		* 真の時::
			cond = [[vim.fn.has"gui" == 1]], -- GUI の時のみ読み込む。 

--		= その他のオプション
--		* インストール時・更新時に指定のコマンドを実行::
--			run = [[:GlowInstall]],
--		* 上と同じ時 bash -c "..." で実行::
--			run = [[npm install]],
--[[		* 依存関係のプラグインを読み込む::
			requires = {"repo"},
		* 関数の指定::
			run = function()
				vim.cmd.GlowInstall()
			end,										]]

require("packer").startup(function()
  -- 起動時に読み込むプラグインは名前を書くだけです
  use "tpope/vim-fugitive"
  use "tpope/vim-repeat"

  -- opt オプションを付けると遅延読み込みになります。
  -- この場合は opt だけで読み込む契機を指定していないため、
  -- packadd コマンドを叩かない限り読み込まれることはありません。
  use { "wbthomason/packer.nvim", opt = true }
  -- packer.nvim 自体を遅延読み込みにする理由はまた後ほど。

  -- コマンドを叩いたときに読み込む。
  use { "rhysd/git-messenger.vim", opt = true, cmd = { "GitMessenger" } }

  -- 特定のイベントで読み込む
  use { "tpope/vim-unimpaired", opt = true, event = { "FocusLost", "CursorHold" } }

  -- 特定のファイルタイプのファイルを開いたら読み込む
  use { "fatih/vim-go", opt = true, ft = { "go" } }

  -- 特定のキーを叩いたら読み込む
  -- この例ではノーマルモードの <CR> にマッピングしていますが、
  -- モードを指定する場合はテーブルを入れ子にします。
  -- keys = {
  --   { "n", "<CR>" },
  --   { "v", "<CR>" },
  -- }
  use {
    "arecarn/vim-fold-cycle",
    opt = true,
    keys = { "<CR>" },
  }

  -- 特定の VimL 関数を呼ぶと読み込む
  -- この例だと、任意の場所で Artify("hoge", "bold") のように呼び出された時に、
  -- このプラグインも読み込まれます。
  use { "sainnhe/artify.vim", opt = true, fn = { "Artify" } }

  -- 実は opt = true は省略できます。読み込む契機（この例では cmd）を指定すると、
  -- 自動的に遅延読み込みとみなされます。
  use {
    "npxbr/glow.nvim",
    cmd = { "Glow", "GlowInstall" },
    -- run オプションを指定すると、インストール時・更新時に
    -- 実行するコマンドを指定できます。
    run = [[:GlowInstall]],
    -- 先頭に : がついていないなら bash -c "..." で実行されます。
    -- run = [[npm install]],
    -- 関数も指定可能です。
    -- run = function()
    --   vim.cmd.GlowInstall()
    -- end,
  }

  -- 条件が真の時のみ読み込みます。条件は起動時に毎回判定されます。
  use {
    "thinca/vim-fontzoom",
    cond = [[vim.fn.has"gui" == 1]], -- GUI の時のみ読み込む。
    -- 関数も指定できます。
    -- conf = function()
    --   return vim.fn.has "gui" == 1
    -- end,
  }

  -- 依存関係も管理できます。vim-prettyprint は capture.vim に依存しています。
  use {
    "tyru/capture.vim",
    requires = {
      { "thinca/vim-prettyprint" },
    },
  }
end)