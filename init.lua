require("base")
require("vim_g")
require("vim_opt")
require("keymaps/vanila")

-- 外部プラグインに依存
-- --[[
require("init_lazy")
require("plugs/lazy")
require("keymaps/plugin")
require("keymaps/lsp")

-- 内部で外部プラグインを require() している 
require("plugs/formatter")
require("plugs/lsp")
require("keymaps/lsp_attach")
-- ]]
