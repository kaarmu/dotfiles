" Vim functions
" Author: kaarmu
" ==============================================================================
" Visual At (@)                                                             {{{1
" ------------------------------------------------------------------------------

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

"                                                                           }}}1
" ==============================================================================
