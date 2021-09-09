" autos.vim, kaarmu
" ==============================================================================
" Autogroups                                                                {{{1
" ------------------------------------------------------------------------------

autocmd TermOpen * setlocal nonu nornu


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

autocmd FileType vim,lua setlocal foldmethod=marker


"                                                                           }}}1
" ==============================================================================
