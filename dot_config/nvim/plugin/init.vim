" init.vim, kaarmu
" ==============================================================================
" vim-plug                                                                  {{{1
" ------------------------------------------------------------------------------

" set termguicolors

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

" Misc                                                                      {{{1
" ------------------------------------------------------------------------------

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_trigger_keyword_length = 2

"                                                                           }}}1
" ==============================================================================
