require("base")
require("vim_g")
require("vim_opt")

-- 外部プラグインに依存
-- [[
require("init_lazy")
require("plugs/lazy")
require("plugs/scripts")
require("keymaps/plugs")

-- 内部で外部プラグインを require() している 
require("plugs/formatter")
require("plugs/lsp")
require("keymaps/lsp_attach")
-- ]]
