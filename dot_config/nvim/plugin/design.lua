-- Neovim design
-- Author: kaarmu
--------------------------------------------------------------------------------
-- Colorscheme

local function auto_colorscheme(light_time, light_cb, dark_time, dark_cb)

    local timer = vim.loop.new_timer()
    timer:start(1, 1000, vim.schedule_wrap(function()

        local hour = tonumber(os.date('%H'))

        if light_time <= hour and hour < dark_time then
            light_cb()
        else
            dark_cb()
        end

    end))

end

local function set_light()
    vim.g.vscode_style = 'light'
    vim.cmd [[ colorscheme vscode ]]
end

local function set_dark()
    vim.g.vscode_style = 'dark'
    vim.cmd [[ colorscheme vscode ]]
end

-- set colorschemes etc.

vim.cmd [[ syntax on ]]
vim.o.termguicolors = true

set_dark()
-- auto_colorscheme(6, set_light, 18, set_dark)

