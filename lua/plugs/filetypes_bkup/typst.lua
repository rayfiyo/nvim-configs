local M = {}

local util = require "formatter.util"

function M.typstfmt()
  return {
    exe = "typstfmt",
    args = { "--verbose" },
  }
end

return M
