-- Two CLI sessions per working directory, sharing a plain right-hand split.
-- Hiding the split keeps the process alive; quitting Neovim ends its sessions.
local M = {}
local sessions, windows = {}, {}

local function hide(win)
    if #vim.api.nvim_tabpage_list_wins(0) > 1 then
        vim.api.nvim_win_hide(win)
    else
        vim.api.nvim_win_set_buf(win, vim.api.nvim_create_buf(true, false))
        vim.w[win].ai_sidebar = nil
        for _, option in ipairs({ "number", "relativenumber", "signcolumn", "statusline", "winfixwidth" }) do
            vim.api.nvim_set_option_value(option, vim.api.nvim_get_option_value(option, { scope = "global" }),
                { win = win })
        end
    end
    windows[vim.api.nvim_get_current_tabpage()] = nil
end

function M.toggle(tool)
    assert(tool == "codex" or tool == "claude", "Unknown AI tool")
    local cwd = vim.fn.getcwd()
    local key = cwd .. "/" .. tool
    local session = sessions[key]
    if session and (not vim.api.nvim_buf_is_valid(session.buf)
        or vim.fn.jobwait({ session.job }, 0)[1] ~= -1) then
        session = nil
        sessions[key] = nil
    end

    if not session and vim.fn.executable(tool) ~= 1 then
        vim.notify(tool .. " is not on PATH. Install its CLI, then restart Neovim.", vim.log.levels.WARN)
        return
    end

    local tab = vim.api.nvim_get_current_tabpage()
    local win = windows[tab]
    if win and (not vim.api.nvim_win_is_valid(win)
        or not vim.w[win].ai_sidebar) then
        win = nil
    end
    if win and session and vim.api.nvim_win_get_buf(win) == session.buf then
        -- Never try to close the last window (for example after :only).
        hide(win)
        return
    end

    if not win then
        vim.cmd("botright vsplit")
        win = vim.api.nvim_get_current_win()
        windows[tab] = win
        vim.w[win].ai_sidebar = true
        vim.api.nvim_win_set_width(win, math.min(80, math.max(35, math.floor(vim.o.columns * 0.4))))
    else
        vim.api.nvim_set_current_win(win)
    end

    if not session then
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_win_set_buf(win, buf)
        vim.bo[buf].bufhidden = "hide"
        local job = vim.fn.jobstart({ tool }, { term = true, cwd = cwd })
        if job <= 0 then
            vim.api.nvim_buf_delete(buf, { force = true })
            vim.notify("Could not start " .. tool, vim.log.levels.ERROR)
            return
        end
        session = { buf = buf, job = job }
        sessions[key] = session
        -- Esc still reaches the CLI. Ctrl-] enters Vim mode for scrolling/yanking.
        vim.keymap.set("t", "<C-]>", "<C-\\><C-n>", { buffer = buf, desc = "Leave AI terminal input" })
        vim.keymap.set("n", "q", function() hide(vim.api.nvim_get_current_win()) end,
            { buffer = buf, desc = "Hide AI sidebar" })
        for _, direction in ipairs({ "h", "j", "k", "l" }) do
            vim.keymap.set("t", "<C-w>" .. direction, "<C-\\><C-n><C-w>" .. direction,
                { buffer = buf, desc = "Move to adjacent window" })
        end
    else
        vim.api.nvim_win_set_buf(win, session.buf)
    end

    vim.wo[win].number = false
    vim.wo[win].relativenumber = false
    vim.wo[win].signcolumn = "no"
    vim.wo[win].winfixwidth = true
    vim.wo[win].statusline = " " .. tool .. "  %=%{fnamemodify(getcwd(), ':t')} "
    vim.cmd.startinsert()
end

return M
