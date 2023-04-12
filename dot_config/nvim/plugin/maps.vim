" Vim maps
" Author: kaarmu
" ==============================================================================
" Move                                                                      {{{1
" ------------------------------------------------------------------------------
nnoremap <A-h> <Cmd>wincmd h<CR>
nnoremap <A-j> <Cmd>wincmd j<CR>
nnoremap <A-k> <Cmd>wincmd k<CR>
nnoremap <A-l> <Cmd>wincmd l<CR>
nnoremap <A-.> <Cmd>tabnext<CR>
nnoremap <A-,> <Cmd>tabprevious<CR>

nmap <C-A-h> <C-w><
nmap <C-A-j> <C-w>-
nmap <C-A-k> <C-w>+
nmap <C-A-l> <C-w>>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

inoremap <A-h> <Esc><Cmd>wincmd h<CR>
inoremap <A-j> <Esc><Cmd>wincmd j<CR>
inoremap <A-k> <Esc><Cmd>wincmd k<CR>
inoremap <A-l> <Esc><Cmd>wincmd l<CR>
inoremap <A-.> <Esc><Cmd>tabnext<CR>
inoremap <A-,> <Esc><Cmd>tabprevious<CR>

vnoremap <A-h> <Cmd>wincmd h<CR>
vnoremap <A-j> <Cmd>wincmd j<CR>
vnoremap <A-k> <Cmd>wincmd k<CR>
vnoremap <A-l> <Cmd>wincmd l<CR>
vnoremap <A-.> <Cmd>tabnext<CR>
vnoremap <A-,> <Cmd>tabprevious<CR>

tnoremap <A-h> <C-\><C-n><Cmd>wincmd h<CR>
tnoremap <A-j> <C-\><C-n><Cmd>wincmd j<CR>
tnoremap <A-k> <C-\><C-n><Cmd>wincmd k<CR>
tnoremap <A-l> <C-\><C-n><Cmd>wincmd l<CR>
tnoremap <A-.> <C-\><C-n><Cmd>tabnext<CR>
tnoremap <A-,> <C-\><C-n><Cmd>tabprevious<CR>

" Windows (splits)                                                          {{{1
" ------------------------------------------------------------------------------
        " (create) window right/left/down/up
nnoremap <silent> <leader>wr <Cmd>bel vnew<CR>
nnoremap <silent> <leader>wl <Cmd>abo vnew<CR>
nnoremap <silent> <leader>wd <Cmd>bel new<CR>
nnoremap <silent> <leader>wu <Cmd>abo new<CR>
        " window quit
nnoremap <leader>wq <Cmd>confirm q<CR>

" Tabs                                                                      {{{1
" ------------------------------------------------------------------------------
        " (create) tab right/left
nnoremap <silent> <leader>t. <Cmd>.tabnew<CR>
nnoremap <silent> <leader>t, <Cmd>-tabnew<CR>
        " tab help/window/terminal/quit
nnoremap <silent> <leader>tw <Cmd>tab split<CR>
nnoremap <silent> <leader>tt <Cmd>tab terminal<CR>
nnoremap <leader>tq <Cmd>confirm tabclose<CR>

" Fold                                                                      {{{1
" ------------------------------------------------------------------------------
        " fold this
nnoremap <silent> <leader>ft za
nnoremap <silent> <leader>fT zA
        " fold all
nnoremap <silent> <leader>fa zM
        " fold none
nnoremap <silent> <leader>fn zR

"                                                                           }}}1
" ==============================================================================
