-- Neovim maps
-- Author: kaarmu
-- =============================================================================
-- General                                                                  {{{1
-- -----------------------------------------------------------------------------

keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>ss', [[ <cmd>SessionSave<CR> ]], {noremap=true})
keymap('n', '<leader>sl', [[ <cmd>SessionLoad<CR> ]], {noremap=true})

keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', {noremap=true})
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {noremap=true})

--                                                                          }}}1
-- =============================================================================
