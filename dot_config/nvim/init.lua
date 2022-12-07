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


--------------------------------------------------------------------------------
-- Bootstraping

local packer_path = (vim.fn.stdpath('data')
                     ..'/site/pack/packer/start/packer.nvim')

if vim.fn.empty(vim.fn.glob(packer_path)) then
    local packer_bootstrap = vim.fn.system({
        'git', 'clone', '--depth','1',
        'https://github.com/wbthomason/packer.nvim',
        packer_path
    })
end


--------------------------------------------------------------------------------
-- Plugins

return require('packer').startup(function(use)

    -- Plugin system
    use 'wbthomason/packer.nvim'
    use { 'dstein64/vim-startuptime', opt = true }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
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
        end,
    }
    use { 'nvim-treesitter/playground', after = 'nvim-treesitter', opt = true }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        config = function()
            local on_attach = function(client, bufnr)

                local keymap = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                local option = function(...) vim.api.nvim_buf_set_option(bufnr, ...) end

                -- Completion triggered by omnifunc (<C-x><C-o>)
                option('omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- Mappings
                local opts = { noremap = true, silent = true }

                keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
                keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
                keymap('n', '<C-f>', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

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

            local capabilities = require('cmp_nvim_lsp').default_capabilities(proto.make_client_capabilities())

            local servers = {
                clangd = {},
                eslint = {},
                pyright = {},
                svelte = {},
                zls = {},
            }

            for server, options in pairs(servers) do
                lspconfig[server].setup(vim.tbl_extend('keep', options, {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }))
            end
        end,
    }

    -- Auto completion
    use {
        'folke/which-key.nvim',
        config = function()
            require('which-key').setup()
        end,
    }
    use 'onsails/lspkind-nvim'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use {
        'hrsh7th/nvim-cmp',
        config = function()
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
        end,
    }

    -- Nice UX
    use 'tpope/vim-commentary'
    use 'tpope/vim-vinegar'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-repeat'
    use { 'junegunn/goyo.vim', opt = true }

    -- Git stuff
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end,
    }
    use 'tpope/vim-fugitive'

    -- Special language support
    use {'ziglang/zig.vim', ft = {'zig'}}
    use {'mattn/emmet-vim', opt = true }

    -- Auto-sync during bootstrap
    if packer_bootstrap then
        require('packer').sync()
    end

end)


