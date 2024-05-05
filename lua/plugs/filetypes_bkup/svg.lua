local defaults = require "formatter.defaults"
local util = require "formatter.util"

local M = {}

M.prettierd = util.copyf(defaults.prettierd)

M.xmlformat = util.copyf(defaults.xmlformat)

return M
