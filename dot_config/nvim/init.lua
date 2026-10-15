vim.g.mapleader = "\\"

vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.signcolumn = "auto"
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.wrap = false
vim.opt.winborder = "single"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.completeopt:append("noselect")

-- Use Ghostty's ANSI palette, including its system-selected foreground/background.
-- Leave 'background' unset so Neovim can detect it from the terminal (OSC 11).
vim.opt.termguicolors = false
vim.cmd.colorscheme("default")
vim.api.nvim_create_autocmd("FocusGained", {
    group = vim.api.nvim_create_augroup("config_terminal_theme", { clear = true }),
    desc = "Refresh terminal appearance after a system theme change",
    callback = function() vim.api.nvim_ui_send("\027]11;?\027\\") end,
})

vim.pack.add({
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://codeberg.org/andyg/leap.nvim" },
    { src = "https://github.com/echasnovski/mini.align" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/tpope/vim-repeat" },
    { src = "https://github.com/tpope/vim-surround" },
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/tpope/vim-commentary" },
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/kaarmu/typst.vim" },
})

require("oil").setup({
    columns = {}, -- Plain filenames; no icon plugin or special font required.
    lsp_file_methods = { enabled = false },
})
require("mini.align").setup()
require("mini.pick").setup()
require("which-key").setup({ icons = { mappings = false } })

local map = vim.keymap.set
map("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory (Oil)" })
map({ "n", "x", "o" }, "s", "<Plug>(leap)", { desc = "Leap" })

map("n", "<leader>h", "<Cmd>Pick help<CR>", { desc = "Search help" })
map("n", "<leader>ff", "<Cmd>Pick files<CR>", { desc = "Find files" })
map("n", "<leader>fb", "<Cmd>Pick buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fg", "<Cmd>Pick grep_live<CR>", { desc = "Search file contents" })
map("n", "<leader>o", function()
    vim.cmd.update()
    dofile(vim.fn.stdpath("config") .. "/init.lua")
end, { desc = "Save and reload config" })

-- Oil still behaves like vinegar with '-'; this is an optional side-by-side view.
map("n", "<leader>e", function()
    require("oil").open(nil, { vertical = true, split = "topleft" }, function()
        vim.api.nvim_win_set_width(0, 30)
    end)
end, { desc = "Open Oil in left split" })

local ai = require("config.ai")
map("n", "<leader>ac", function() ai.toggle("codex") end, { desc = "Codex sidebar" })
map("n", "<leader>aa", function() ai.toggle("claude") end, { desc = "Claude sidebar" })
vim.api.nvim_create_user_command("Codex", function() ai.toggle("codex") end,
    { desc = "Toggle Codex sidebar", force = true })
vim.api.nvim_create_user_command("Claude", function() ai.toggle("claude") end,
    { desc = "Toggle Claude sidebar", force = true })

require("which-key").add({
    { "<leader>a", group = "AI" },
    { "<leader>f", group = "Find" },
})

-- Catch external edits after working with an AI tool; do not overwrite unsaved work.
vim.api.nvim_create_autocmd({ "FocusGained", "TermLeave", "BufEnter" }, {
    group = vim.api.nvim_create_augroup("config_checktime", { clear = true }),
    callback = function()
        if vim.fn.mode() ~= "c" and vim.bo.buftype == "" then
            vim.cmd.checktime()
        end
    end,
})
