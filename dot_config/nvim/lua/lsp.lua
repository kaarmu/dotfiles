-- LSP configuration
-- Author: kaarmu
--------------------------------------------------------------------------------
-- lspsaga

error('this runs')

local conf = require 'lspconfig'
local proto = require 'vim.lsp.protocol'

local on_attach = function(client, bufnr)

    local keymap = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local option = function(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Mappings
    local opts = { noremap = true, silent = true }

    keymap('n', '<leader>cd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', '<leader>cD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    keymap('n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>', opts)
    keymap('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
    keymap('n', '<leader>cn', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
    keymap('n', '<leader>cp', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
    keymap('n', '<leader>hd', '<cmd>Lspsaga hover_doc<CR>', opts)
    keymap('n', '<leader>ht', '<cmd>Lspsaga signature_help<CR>', opts)
    keymap('n', '<leader>hr', '<cmd>Lspsaga rename<CR>', opts)
    keymap('n', '<leader>hf', '<cmd>Lspsaga lsp_finder<CR>', opts)

    require('completion').on_attach(client, bufnr)

    proto.CompletionItemKind = {
        '', -- Text
        '', -- Method
        '', -- Function
        '', -- Constructor
        '', -- Field
        '', -- Variable
        '', -- Class
        'ﰮ', -- Interface
        '', -- Module
        '', -- Property
        '', -- Unit
        '', -- Value
        '', -- Enum
        '', -- Keyword
        '﬌', -- Snippet
        '', -- Color
        '', -- File
        '', -- Reference
        '', -- Folder
        '', -- EnumMember
        '', -- Constant
        '', -- Struct
        '', -- Event
        'ﬦ', -- Operator
        '', -- TypeParameter
    }

end

--------------------------------------------------------------------------------
-- LSP client setups

conf.clangd.setup {
    on_attach = on_attach,
}

conf.pylsp.setup {
    on_attach = on_attach,
    cmd = { 'pylsp' },
}

