" autos.vim, kaarmu
" ==============================================================================
" Autocmds                                                                  {{{1
" ------------------------------------------------------------------------------

autocmd TermOpen * setlocal nonu nornu

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
