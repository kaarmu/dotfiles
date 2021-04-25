util = require("lspconfig/util")

-- c++ : paru -S ccls
require'lspconfig'.ccls.setup({
    autostart = true,
    on_attach=require'completion'.on_attach,
})

-- python : pip install python-language-server
require'lspconfig'.pyls.setup({
    autostart = true,
    cmd = { "python","-m", "pyls" },
    filetypes = { "python" },
    on_attach=require'completion'.on_attach,
})

-- vim : npm install -g vim-language-server
require'lspconfig'.vimls.setup({
    autostart = true,
    on_attach=require'completion'.on_attach,
})

-- bash : npm install -g bash-language-server
require'lspconfig'.bashls.setup({
    autostart = true,
    on_attach=require'completion'.on_attach,
})

-- nim : nimble install nimlsp
require'lspconfig'.nimls.setup({
    on_attach=require'completion'.on_attach
})

-- lua : paru -S lua-language-server
-- probably gonna fail, https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sumneko_lua

local sumneko_binary = "/usr/bin/lua-language-server"
local sumneko_root_path = "/usr/share/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
  autostart = true,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- fsharp : Plug 'fsharp/vim-fsharp'
require'lspconfig'.fsautocomplete.setup{
  cmd = {'dotnet', '/home/kaarmu/.local/share/nvim/fsac/fsautocomplete.dll', '--background-service-enabled'}
}

