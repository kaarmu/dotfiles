" Vim auto-cmds and groups
" Author: kaarmu
" ==============================================================================
" Autocmds                                                                  {{{1
" ------------------------------------------------------------------------------

if has('nvim')
    autocmd TermOpen * setlocal nonu nornu
else
    autocmd TerminalWinOpen * setlocal nonu nornu
endif

autocmd FileType vim,lua setlocal foldmethod=marker


" Autogroups                                                                {{{1
" ------------------------------------------------------------------------------

function! TrimeWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

augroup AllBuffers
    autocmd!
    autocmd BufWritePre * :call TrimeWhitespace()
augroup END


"                                                                           }}}1
" ==============================================================================
