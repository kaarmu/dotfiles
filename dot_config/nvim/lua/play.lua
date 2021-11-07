-- Play functions for my config
--------------------------------------------------------------------------------

local M = {}

-- <S-Tab> for removing tab
function M.remove_tab_on_current_line()
    local line = vim.api.nvim_get_current_line()

    local str
    local len

    if vim.o.expandtab then
        len = vim.o.softtabstop
        str = (' '):rep(len)
    else
        len = 1
        str = '\t'
    end

    print('"', str, '"')

    if line:sub(1, len) == str then
        line = line:sub(len+1)
        vim.api.nvim_set_current_line(line)
    end


end

return M
