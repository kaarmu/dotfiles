-- Neovim maps
-- Author: kaarmu
--------------------------------------------------------------------------------

keymap = vim.api.nvim_set_keymap

--------------------------------------------------------------------------------
-- Plugins

keymap('n', '<leader>ff', [[ <cmd>Telescope find_files<CR> ]], {noremap=True})
keymap('n', '<leader>fg', [[ <cmd>Telescope live_grep<CR> ]], {noremap=True})

keymap('n', '<leader>ss', [[ <cmd>SessionSave<CR> ]], {noremap=True})
keymap('n', '<leader>sl', [[ <cmd>SessionLoad<CR> ]], {noremap=True})


--------------------------------------------------------------------------------
