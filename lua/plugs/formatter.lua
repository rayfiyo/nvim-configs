-- https://github.com/mhartington/formatter.nvim#configure
-- ~/.local/share/nvim/lazy/formatter.nvim/lua/formatter/default

-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	logging = true, -- Enable or disable logging
	log_level = vim.log.levels.WARN, -- Set the log level
	filetype = { -- All formatter configurations are opt-in
		-- not prettierd
		go = { require("formatter.filetypes.go").gofumpt },
		lua = { require("formatter.filetypes.lua").stylua },
		yaml = { require("formatter.filetypes.yaml").yamlfmt },
		latex = {
			require("formatter.filetypes.latex").latexindent,
			require("formatter.filetypes.tex").latexindent,
		},

		-- prettierd
		css = { require("formatter.filetypes.css").prettierd },
		graphql = { require("formatter.filetypes.graphql").prettierd },
		html = { require("formatter.filetypes.html").prettierd },
		json = { require("formatter.filetypes.json").prettierd },
		javascript = { require("formatter.filetypes.javascript").prettierd },
		markdown = { require("formatter.filetypes.markdown").prettierd },
		typescript = { require("formatter.filetypes.typescript").prettierd },
		vue = { require("formatter.filetypes.vue").prettierd },

		-- any file
		["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
	},
})

-- prettierd but not support formatter.vim
-- https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
-- angular = { require("formatter.filetypes.angular").prettierd },
-- flow = { require("formatter.filetypes.flow").prettierd },
-- jsx = { require("formatter.filetypes.jsx").prettierd },
-- less = { require("formatter.filetypes.less").prettierd },
-- scss = { require("formatter.filetypes.scss").prettierd },
