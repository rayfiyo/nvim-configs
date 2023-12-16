-- https://github.com/mhartington/formatter.nvim#configure
-- ~/.local/share/nvim/lazy/formatter.nvim/lua/formatter/default

-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	logging = true, -- Enable or disable logging
	log_level = vim.log.levels.WARN, -- Set the log level
	filetype = { -- All formatter configurations are opt-in
		go = { require("formatter.filetypes.go").gofumpt },
		lua = { require("formatter.filetypes.lua").stylua },
		yaml = { require("formatter.filetypes.yaml").yamlfmt },
		
        ["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
	},
})
