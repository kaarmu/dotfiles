local vim = vim -- For collecting diagnostic errors

vim.g.mapleader = "\\"
vim.o.expandtab = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.o.smartindent = true
vim.o.softtabstop = 4
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.winborder = "rounded"
vim.o.wrap = false

vim.cmd("set completeopt+=noselect")

vim.keymap.set('n', "<leader>o", ":update<CR>:source<CR>")

vim.pack.add({
    -- Core Operations
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/ggandor/leap.nvim" },
    { src = "https://github.com/echasnovski/mini.align" },
    { src = "https://github.com/echasnovski/mini.pick" },
    -- LSP
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    -- Colorscheme
    { src = "https://github.com/vague2k/vague.nvim" },
    -- tpope <3
    { src = "https://github.com/tpope/vim-repeat" },
    { src = "https://github.com/tpope/vim-surround" },
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/tpope/vim-commentary" },
    -- Fancy Movement (trigger with 's')
    { src = "https://github.com/ggandor/leap.nvim" }, -- requires tpope/vim-repeat
    -- Command Hints 
    { src = "https://github.com/folke/which-key.nvim" },
})

-- Core Operations

require("oil").setup({})
vim.keymap.set('n', "-", ":Oil<CR>")

require("leap").set_default_mappings()

require("mini.align").setup({})

require("mini.pick").setup({})
vim.keymap.set('n', "<leader>h", ":Pick help<CR>")

-- LSP

require("mason").setup()

vim.lsp.enable({ "lua_ls", "basedpyright" })
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, {
                autotrigger = true,
            })
        end
    end,
})

-- Colorscheme

require("vague").setup({
    transparent = true,
})

vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

