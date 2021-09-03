-- Neovim configuration file
-- Author: kaarmu
--------------------------------------------------------------------------------
-- PLUGINS

vim.cmd 'source ~/.config/nvim/plug.vim'

vim.cmd 'set list'
vim.cmd 'set listchars=tab:»·,trail:·'

vim.cmd 'autocmd TermOpen * setlocal nonu nornu'


--------------------------------------------------------------------------------
-- Treesitter

-- require('nvim-treesitter.configs').setup {
--     highlight = {
--         enable = true,
--         disable = {},
--     },
--     indent = {
--         enable = true,
--         disable = {},
--     },
--     ensure_installed = {
--         'c',
--         'cpp',
--         'python',
--         'lua',
--     }
-- }


--------------------------------------------------------------------------------
-- Telescope

local actions = require 'telescope.actions'

require('telescope').setup {
    defaults = {
        mappings = {
            n = { ['q'] = actions.close },
        },
    },
}


--------------------------------------------------------------------------------
-- lualine

require('plenary.reload').reload_module('lualine', true)

require('lualine').setup {
    options = { theme = 'darkplus' }
}


--------------------------------------------------------------------------------
-- Gitsigns

require('gitsigns').setup()


--------------------------------------------------------------------------------
-- lspsaga

require('lspsaga').init_lsp_saga {
    -- use_saga_diagnostic_sign = false,
    error_sign = '\u{f659}', -- close circle
    warn_sign = '\u{fad5}', -- alert circle
    hint_sign = '\u{fb24}', -- help circle
    infor_sign = '\u{f7fc}', -- information outline
    border_style = 'round',
}


--------------------------------------------------------------------------------
-- Nvim Tree

vim.g.nvim_tree_auto_open = 0               -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
vim.g.nvim_tree_auto_close = 1              -- 0 by default, closes the tree when it's the last window
vim.g.nvim_tree_highlight_opened_files = 1  -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_lsp_diagnostics = 1         -- 0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics



-- Temporary configurations for development
--------------------------------------------------------------------------------

vim.cmd 'set termguicolors'
require('colorizer').setup()

vim.cmd [[nnoremap <leader>qs <cmd>lua require('darkplus').query_syntax()<CR>]]
vim.cmd 'command! QuerySyntax lua require("darkplus").query_syntax()'



