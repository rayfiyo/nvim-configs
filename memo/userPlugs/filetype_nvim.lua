require("filetype").setup({
    overrides = {
        extensions = {
            -- *.pnファイルのファイルタイプをpotionに設定する
            pn = "potion",
        },
        literal = {
            -- MyBackupFileという名前のファイルのファイルタイプをluaに設定する
            MyBackupFile = "lua",
        },
        complex = {
            -- 正規表現に一致する完全なファイル名のファイルタイプを gitconfigに設定する。
            [".*git/config"] = "gitconfig", -- Included in the plugin
        },

        -- キーが関数にマップされている以外は上記と同じ
        function_extensions = {
            ["cpp"] = function()
                vim.bo.filetype = "cpp"
                -- 煩わしいインデントジャンプを削除する
                -- vim.bo.cinoptions = vim.bo.cinoptions .. "L0"
            end,
            ["pdf"] = function()
                vim.bo.filetype = "pdf"
                -- PDFビューアー（Skim.app）で自動的に開く
                vim.fn.jobstart(
                    "open -a skim " .. '"' .. vim.fn.expand("%") .. '"'
                )
            end,
        },
        function_literal = {
            Brewfile = function()
                vim.cmd("syntax off")
            end,
        },
        function_complex = {
            ["*.math_notes/%w+"] = function()
                vim.cmd("iabbrev $ $$")
            end,
        },

        shebang = {
            -- dash(--)で始まるシェバンを持つファイルのファイルタイプを "sh" に設定する。
            dash = "sh",
        },
    },
})