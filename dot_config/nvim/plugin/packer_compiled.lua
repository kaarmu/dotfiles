-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/kaarmu/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/kaarmu/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/kaarmu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/kaarmu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/kaarmu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/opt/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n\\\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\vvscode\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_prev_item\fvisibleé\5\1\0\t\0%\0C6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\24\0005\4\5\0009\5\3\0009\5\4\5)\a¸ˇB\5\2\2=\5\6\0049\5\3\0009\5\4\5)\a\4\0B\5\2\2=\5\a\0049\5\3\0009\5\b\5B\5\1\2=\5\t\0049\5\3\0009\5\n\0055\a\r\0009\b\v\0009\b\f\b=\b\14\aB\5\2\2=\5\15\0049\5\3\0009\5\16\5B\5\1\2=\5\17\0043\5\18\0=\5\19\0043\5\20\0=\5\21\0049\5\3\0009\5\n\0055\a\22\0009\b\v\0009\b\f\b=\b\14\aB\5\2\2=\5\23\4=\4\3\0034\4\4\0005\5\25\0>\5\1\0045\5\26\0>\5\2\0045\5\27\0>\5\3\4=\4\28\0035\4\"\0006\5\0\0'\a\29\0B\5\2\0029\5\30\0055\a\31\0005\b \0=\b!\aB\5\2\2=\5#\4=\4$\3B\1\2\0012\0\0ÄK\0\1\0\15formatting\vformat\1\0\0\tmenu\1\0\4\vbuffer\n[buf]\tpath\v[path]\rnvim_lsp\n[lsp]\14gh_issues\r[issues]\1\0\2\rmaxwidth\0032\14with_text\2\15cmp_format\flspkind\fsources\1\0\2\tname\vbuffer\19keyword_length\3\5\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\1\0\0\t<CR>\1\0\1\vselect\2\f<S-Tab>\0\n<Tab>\0\14<C-Space>\rcomplete\n<C-y>\14behaviour\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\n<C-e>\nclose\n<C-d>\n<C-u>\1\0\0\16scroll_docs\fmapping\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_option\bapi\bvim¡\4\1\2\v\0\20\00033\2\0\0003\3\1\0\18\4\3\0'\6\2\0'\a\3\0B\4\3\0015\4\4\0\18\5\2\0'\a\5\0'\b\6\0'\t\a\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\b\0'\t\t\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\n\0'\t\v\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\f\0'\t\r\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\14\0'\t\15\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\16\0'\t\17\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\18\0'\t\19\0\18\n\4\0B\5\5\0012\0\0ÄK\0\1\0*<cmd>lua vim.lsp.buf.formatting()<CR>\14<leader>f*<cmd>lua vim.lsp.buf.references()<CR>\agr&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>rn.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi+<cmd>lua vim.lsp.buf.declaration()<CR>\agD*<cmd>lua vim.lsp.buf.definition()<CR>\agd\6n\1\0\2\fnoremap\2\vsilent\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0„\3\1\0\17\0\22\0+3\0\0\0006\1\1\0'\3\2\0B\1\2\0026\2\1\0'\4\3\0B\2\2\0025\3\5\0=\3\4\0026\3\1\0'\5\6\0B\3\2\0029\3\a\0039\5\b\2B\5\1\0A\3\0\0025\4\t\0004\5\0\0=\5\n\0044\5\0\0=\5\v\0044\5\0\0=\5\f\0044\5\0\0=\5\r\0046\5\14\0\18\a\4\0B\5\2\4H\b\vÄ8\n\b\0019\n\15\n6\f\16\0009\f\17\f'\14\18\0\18\15\t\0005\16\19\0=\0\20\16=\3\21\16B\f\4\0A\n\0\1F\b\3\3R\bÛK\0\1\0\17capabilities\14on_attach\1\0\0\tkeep\15tbl_extend\bvim\nsetup\npairs\vsvelte\bzls\fpyright\vclangd\1\0\0\29make_client_capabilities\24update_capabilities\17cmp_nvim_lsp\1\26\0\0\bÓòí\bÔûî\bÔûî\bÔûî\bÓûõ\bÓûõ\bÔÉ®\bÔ∞Æ\bÔ£ñ\bÓò§\bÔëµ\bÔ¢ü\bÔÉä\bÔ†ä\bÔ¨å\bÓà´\bÔÖõ\bÔöê\bÔÑï\bÔÖù\bÓà¨\bÔÉä\bÔÉß\bÔ¨¶\bÓòé\23CompletionItemKind\21vim.lsp.protocol\14lspconfig\frequire\0\0" },
    loaded = true,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    after = { "playground" },
    loaded = true,
    only_config = true
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-startuptime"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/start/vim-vinegar",
    url = "https://github.com/tpope/vim-vinegar"
  },
  ["vscode.nvim"] = {
    loaded = true,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zig.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/kaarmu/.local/share/nvim/site/pack/packer/opt/zig.vim",
    url = "https://github.com/ziglang/zig.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n\\\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\vvscode\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_option\bapi\bvim¡\4\1\2\v\0\20\00033\2\0\0003\3\1\0\18\4\3\0'\6\2\0'\a\3\0B\4\3\0015\4\4\0\18\5\2\0'\a\5\0'\b\6\0'\t\a\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\b\0'\t\t\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\n\0'\t\v\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\f\0'\t\r\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\14\0'\t\15\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\16\0'\t\17\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\18\0'\t\19\0\18\n\4\0B\5\5\0012\0\0ÄK\0\1\0*<cmd>lua vim.lsp.buf.formatting()<CR>\14<leader>f*<cmd>lua vim.lsp.buf.references()<CR>\agr&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>rn.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi+<cmd>lua vim.lsp.buf.declaration()<CR>\agD*<cmd>lua vim.lsp.buf.definition()<CR>\agd\6n\1\0\2\fnoremap\2\vsilent\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0„\3\1\0\17\0\22\0+3\0\0\0006\1\1\0'\3\2\0B\1\2\0026\2\1\0'\4\3\0B\2\2\0025\3\5\0=\3\4\0026\3\1\0'\5\6\0B\3\2\0029\3\a\0039\5\b\2B\5\1\0A\3\0\0025\4\t\0004\5\0\0=\5\n\0044\5\0\0=\5\v\0044\5\0\0=\5\f\0044\5\0\0=\5\r\0046\5\14\0\18\a\4\0B\5\2\4H\b\vÄ8\n\b\0019\n\15\n6\f\16\0009\f\17\f'\14\18\0\18\15\t\0005\16\19\0=\0\20\16=\3\21\16B\f\4\0A\n\0\1F\b\3\3R\bÛK\0\1\0\17capabilities\14on_attach\1\0\0\tkeep\15tbl_extend\bvim\nsetup\npairs\vsvelte\bzls\fpyright\vclangd\1\0\0\29make_client_capabilities\24update_capabilities\17cmp_nvim_lsp\1\26\0\0\bÓòí\bÔûî\bÔûî\bÔûî\bÓûõ\bÓûõ\bÔÉ®\bÔ∞Æ\bÔ£ñ\bÓò§\bÔëµ\bÔ¢ü\bÔÉä\bÔ†ä\bÔ¨å\bÓà´\bÔÖõ\bÔöê\bÔÑï\bÔÖù\bÓà¨\bÔÉä\bÔÉß\bÔ¨¶\bÓòé\23CompletionItemKind\21vim.lsp.protocol\14lspconfig\frequire\0\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_prev_item\fvisibleé\5\1\0\t\0%\0C6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\24\0005\4\5\0009\5\3\0009\5\4\5)\a¸ˇB\5\2\2=\5\6\0049\5\3\0009\5\4\5)\a\4\0B\5\2\2=\5\a\0049\5\3\0009\5\b\5B\5\1\2=\5\t\0049\5\3\0009\5\n\0055\a\r\0009\b\v\0009\b\f\b=\b\14\aB\5\2\2=\5\15\0049\5\3\0009\5\16\5B\5\1\2=\5\17\0043\5\18\0=\5\19\0043\5\20\0=\5\21\0049\5\3\0009\5\n\0055\a\22\0009\b\v\0009\b\f\b=\b\14\aB\5\2\2=\5\23\4=\4\3\0034\4\4\0005\5\25\0>\5\1\0045\5\26\0>\5\2\0045\5\27\0>\5\3\4=\4\28\0035\4\"\0006\5\0\0'\a\29\0B\5\2\0029\5\30\0055\a\31\0005\b \0=\b!\aB\5\2\2=\5#\4=\4$\3B\1\2\0012\0\0ÄK\0\1\0\15formatting\vformat\1\0\0\tmenu\1\0\4\vbuffer\n[buf]\tpath\v[path]\rnvim_lsp\n[lsp]\14gh_issues\r[issues]\1\0\2\rmaxwidth\0032\14with_text\2\15cmp_format\flspkind\fsources\1\0\2\tname\vbuffer\19keyword_length\3\5\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\1\0\0\t<CR>\1\0\1\vselect\2\f<S-Tab>\0\n<Tab>\0\14<C-Space>\rcomplete\n<C-y>\14behaviour\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\n<C-e>\nclose\n<C-d>\n<C-u>\1\0\0\16scroll_docs\fmapping\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n‹\1\0\0\5\0\v\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\5\0005\3\3\0004\4\0\0=\4\4\3=\3\6\0025\3\a\0004\4\0\0=\4\4\3=\3\b\0025\3\t\0=\3\n\2B\0\2\1K\0\1\0\21ensure_installed\1\b\0\0\fcomment\6c\bcpp\vpython\blua\vsvelte\bzig\vindent\1\0\1\venable\2\14highlight\1\0\0\fdisable\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd playground ]]
time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType zig ++once lua require("packer.load")({'zig.vim'}, { ft = "zig" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/kaarmu/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]], true)
vim.cmd [[source /home/kaarmu/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]]
time([[Sourcing ftdetect script at: /home/kaarmu/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
