-- Neovim configuration file
-- Author: kaarmu
--------------------------------------------------------------------------------
-- General

vim.cmd 'source ~/.config/nvim/plug.vim'

vim.g.mapleader = ';'


--------------------------------------------------------------------------------
-- Dashboard

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_shortcut = {
    last_session       = vim.g.mapleader .. ' s l',
    find_history       = vim.g.mapleader .. ' f h',
    find_file          = vim.g.mapleader .. ' f f',
    new_file           = vim.g.mapleader .. ' c n',
    change_colorscheme = vim.g.mapleader .. ' t c',
    find_word          = vim.g.mapleader .. ' f a',
    book_marks         = vim.g.mapleader .. ' f b',
}


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


require('nvim-tree').setup {
    nvim_tree_auto_open = 0               -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
    nvim_tree_auto_close = 1              -- 0 by default, closes the tree when it's the last window
    nvim_tree_highlight_opened_files = 1  -- 0 by default, will enable folder and file icon highlight for opened files/directories.
    nvim_tree_lsp_diagnostics = 1         -- 0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
}

--------------------------------------------------------------------------------
-- completion-nvim

vim.g.completion_matching_strategy_lst = {'exact', 'substring', 'fuzzy'}


-- Temporary configurations for development
--------------------------------------------------------------------------------

vim.cmd 'set termguicolors'
require('colorizer').setup()

vim.cmd [[nnoremap <leader>qs <cmd>lua require('darkplus').query_syntax()<CR>]]
vim.cmd 'command! QuerySyntax lua require("darkplus").query_syntax()'



