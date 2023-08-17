-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/ray/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/ray/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/ray/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/ray/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ray/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cellular-automaton.nvim"] = {
    commands = { "CellularAutomaton" },
    keys = { { "n", "<leader>r" }, { "v", "<leader>r" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ray/.local/share/nvim/site/pack/packer/opt/cellular-automaton.nvim",
    url = "https://github.com/Eandrju/cellular-automaton.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/ray/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/ray/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-scrollview"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/ray/.local/share/nvim/site/pack/packer/opt/nvim-scrollview",
    url = "https://github.com/dstein64/nvim-scrollview"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/ray/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["open-browser.vim"] = {
    commands = { "<Plug>(openbrowser-smart-search)" },
    keys = { { "n", "<Leader><C-l>" }, { "v", "<Leader><C-l>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ray/.local/share/nvim/site/pack/packer/opt/open-browser.vim",
    url = "https://github.com/tyru/open-browser.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ray/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  previm = {
    commands = { "PrevimOpen" },
    keys = { { "n", "<C-p>" }, { "v", "<C-p>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ray/.local/share/nvim/site/pack/packer/opt/previm",
    url = "https://github.com/previm/previm"
  },
  ["translate.vim"] = {
    commands = { "Translate" },
    keys = { { "n", "<Leader>t" }, { "v", "<Leader>t" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ray/.local/share/nvim/site/pack/packer/opt/translate.vim",
    url = "https://github.com/skanehira/translate.vim"
  },
  ["vim-maketable"] = {
    commands = { "'<,'>MakeTable", "'<,'>MakeTable!", "'<,'>MakeTable" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ray/.local/share/nvim/site/pack/packer/opt/vim-maketable",
    url = "https://github.com/mattn/vim-maketable"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/home/ray/.local/share/nvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  },
  ["vimdoc-ja"] = {
    loaded = true,
    path = "/home/ray/.local/share/nvim/site/pack/packer/start/vimdoc-ja",
    url = "https://github.com/vim-jp/vimdoc-ja"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: nvim-scrollview
time([[Setup for nvim-scrollview]], true)
try_loadstring("\27LJ\2\nˆ\2\0\0\5\0\r\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0024\3\3\0006\4\b\0009\4\t\0049\4\n\0049\4\v\4>\4\1\3=\3\f\2B\0\2\1K\0\1\0\27diagnostics_severities\nERROR\rseverity\15diagnostic\bvim\21signs_on_startup\1\2\0\0\ball\23excluded_filetypes\1\0\4\17current_only\2\tbase\vbuffer\vcolumn\3‚\1\rwinblend\3d\1\2\0\0\rnerdtree\nsetup\15scrollview\frequire\0", "setup", "nvim-scrollview")
time([[Setup for nvim-scrollview]], false)
time([[packadd for nvim-scrollview]], true)
vim.cmd [[packadd nvim-scrollview]]
time([[packadd for nvim-scrollview]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[au CmdUndefined '<,'>MakeTable! ++once lua require"packer.load"({'vim-maketable'}, {}, _G.packer_plugins)]])
pcall(vim.api.nvim_create_user_command, 'Translate', function(cmdargs)
          require('packer.load')({'translate.vim'}, { cmd = 'Translate', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'translate.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Translate ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'PrevimOpen', function(cmdargs)
          require('packer.load')({'previm'}, { cmd = 'PrevimOpen', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'previm'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('PrevimOpen ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'CellularAutomaton', function(cmdargs)
          require('packer.load')({'cellular-automaton.nvim'}, { cmd = 'CellularAutomaton', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'cellular-automaton.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('CellularAutomaton ', 'cmdline')
      end})
pcall(vim.cmd, [[au CmdUndefined <Plug>(openbrowser-smart-search) ++once lua require"packer.load"({'open-browser.vim'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined '<,'>MakeTable ++once lua require"packer.load"({'vim-maketable', 'vim-maketable'}, {}, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[vnoremap <silent> <leader>r <cmd>lua require("packer.load")({'cellular-automaton.nvim'}, { keys = "<lt>leader>r", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>r <cmd>lua require("packer.load")({'cellular-automaton.nvim'}, { keys = "<lt>leader>r", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> <Leader><C-l> <cmd>lua require("packer.load")({'open-browser.vim'}, { keys = "<lt>Leader><lt>C-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> <Leader>t <cmd>lua require("packer.load")({'translate.vim'}, { keys = "<lt>Leader>t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader><C-l> <cmd>lua require("packer.load")({'open-browser.vim'}, { keys = "<lt>Leader><lt>C-l>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>t <cmd>lua require("packer.load")({'translate.vim'}, { keys = "<lt>Leader>t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> <C-p> <cmd>lua require("packer.load")({'previm'}, { keys = "<lt>C-p>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-p> <cmd>lua require("packer.load")({'previm'}, { keys = "<lt>C-p>", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
