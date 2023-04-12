-- Neovim design
-- Author: kaarmu
-- =============================================================================
-- Colorscheme                                                              {{{1
-- -----------------------------------------------------------------------------

local function colorscheme_timer(light_time, light_cb, dark_time, dark_cb)

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

local function colorscheme_auto(light_cb, dark_cb)

    local timer = vim.loop.new_timer()
    timer:start(1, 1000, vim.schedule_wrap(function()

        local file = io.popen [[ gsettings get org.gnome.desktop.interface color-scheme ]]

        if string.find(file:read(), 'dark') then
            dark_cb()
        else
            light_cb()
        end

        file:close()

    end))

end

-- Callbacks

local function set_light()
    -- vim.o.background = 'light'
    -- vim.cmd [[ colorscheme vscode ]]
    require('vscode').load('light')
end

local function set_dark()
    -- vim.o.background = 'dark'
    -- vim.cmd [[ colorscheme vscode ]]
    require('vscode').load('dark')
end

-- set colorschemes etc.

vim.cmd [[ syntax on ]]
vim.o.termguicolors = true

-- set_dark()
colorscheme_auto(set_light, set_dark)

--                                                                          }}}1
-- =============================================================================
