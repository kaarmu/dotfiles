-- Neovim configuration file
-- Author: kaarmu
--------------------------------------------------------------------------------
-- General

vim.cmd [[ set guifont=FiraCode\ Nerd\ Font:h16 ]]

vim.api.nvim_set_keymap(
    'i','<S-Tab>',
    [[<cmd>lua require('misc').remove_tab_on_current_line()<CR>]],
    { noremap = true, silent = true }
)

require('plugins')


--------------------------------------------------------------------------------
-- Dashboard

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_shortcut = {
    last_session       = '\\sl',
    find_history       = '\\fh',
    find_file          = '\\ff',
    new_file           = '\\cn',
    change_colorscheme = '\\tc',
    find_word          = '\\fa',
    book_marks         = '\\fb',
}


--------------------------------------------------------------------------------
-- Treesitter

require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        'comment',
        'c',
        'cpp',
        'python',
        'lua',
        'svelte',
        'zig',
    }
}


--------------------------------------------------------------------------------
-- LSP config

local on_attach = function(client, bufnr)

    local keymap = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local option = function(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Mappings
    local opts = { noremap = true, silent = true }

    keymap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    keymap('n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>', opts)
    keymap('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
    keymap('n', '<leader>cn', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
    keymap('n', '<leader>cp', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
    keymap('n', '<leader>hd', '<cmd>Lspsaga hover_doc<CR>', opts)
    keymap('n', '<leader>ht', '<cmd>Lspsaga signature_help<CR>', opts)
    keymap('n', '<leader>hr', '<cmd>Lspsaga rename<CR>', opts)
    keymap('n', '<leader>hf', '<cmd>Lspsaga lsp_finder<CR>', opts)

end

local lspconfig = require('lspconfig')
local proto = require('vim.lsp.protocol')

proto.CompletionItemKind = {
--  Text        Method  Function    Constructor     Field   Variable    Class
    '',        '',    '',        '',            '',    '',        '',
--  Interface   Module  Property    Unit            Value   Enum        Keyword
    'ﰮ',        '',    '',        '',            '',    '',        '',
--  Snippet     Color   File        Reference       Folder  EnumMember  Constant
    '﬌',        '',    '',        '',            '',    '',        '',
--  Struct      Event   Operator    TypeParameter
    '',        '',    'ﬦ',        '',
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(proto.make_client_capabilities())

local servers = {
    clangd = {},
    pylsp = {},
    zls = {},
    svelte = {},
}

for server, options in pairs(servers) do
    lspconfig[server].setup(vim.tbl_extend('keep', options, {
        on_attach = on_attach,
        capabilities = capabilities,
    }))
end



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
    options = { theme = 'vscode' }
}


--------------------------------------------------------------------------------
-- Gitsigns

require('gitsigns').setup()


--------------------------------------------------------------------------------
-- lspsaga

require('lspsaga').init_lsp_saga {
    -- use_saga_diagnostic_sign = false,
    error_sign = '', -- close circle
    warn_sign = '𥉉', -- alert circle
    hint_sign = 'ﬤ', -- help circle
    infor_sign = '', -- information outline
    border_style = 'round',
    code_action_prompt = { enable = false },
}


--------------------------------------------------------------------------------
-- Nvim Tree


require('nvim-tree').setup {
    nvim_tree_auto_close = true,            -- false by default, closes the tree when it's the last window
    nvim_tree_highlight_opened_files = 2,   -- 0 by default, 2 = Enable highligting for folders and file names only.
    diagnostics = {
        enable = true,                      -- false by default, enable/disable the feature
    },
    update_cwd = 1,                         -- false by default, changes the tree root directory on `DirChanged` and refreshes the tree.
}

--------------------------------------------------------------------------------
-- nvim-cmp

local cmp = require('cmp')

cmp.setup {
    mapping = {
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-y>'] = cmp.mapping.confirm({
            behaviour = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
        ['<CR>'] = cmp.mapping.confirm({
            behaviour = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
    },
    sources = {
        { name = 'gh_issues' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 5 },
    },
    formatting = {
        format = require('lspkind').cmp_format({
            maxwidth = 50,
            with_text = true,
            menu = {
                nvim_lsp = '[lsp]',
                path = '[path]',
                buffer = '[buf]',
                gh_issues = '[issues]',
            },
        })
    },
}


