" nvim maps, kaarmu
" ==============================================================================
" Vim                                                                       {{{1
" ------------------------------------------------------------------------------
inoremap <silent> <leader><leader> <Esc>
vnoremap <silent> <leader><leader> <Esc>
cnoremap <silent> <leader><leader> <Esc>
tnoremap <silent> <leader><leader> <C-\><C-n>

        " edit config
nnoremap <silent> <leader>ec :e ~/.config/nvim/init.lua<CR>

        " Toggle ---
nnoremap <silent> <leader>Tn :set rnu!<CR>:set nu!<CR>
nnoremap <silent> <leader>Tw :set wrap!<CR>
nnoremap <silent> <leader>Tc :execute "set colorcolumn="
                                \ . (&colorcolumn == "" ? "80" : "")<CR>
nnoremap <silent> <leader>Tl :set cursorline!<CR>

        " search abort
nnoremap <silent> <leader>sa :nohlsearch<CR>

" Move                                                                      {{{1
" ------------------------------------------------------------------------------
nnoremap <A-h> <cmd>wincmd h<CR>
nnoremap <A-j> <cmd>wincmd j<CR>
nnoremap <A-k> <cmd>wincmd k<CR>
nnoremap <A-l> <cmd>wincmd l<CR>
nnoremap <A-.> <cmd>tabnext<CR>
nnoremap <A-,> <cmd>tabprevious<CR>

nmap <C-A-h> <C-w><
nmap <C-A-j> <C-w>-
nmap <C-A-k> <C-w>+
nmap <C-A-l> <C-w>>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

inoremap <A-h> <Esc><cmd>wincmd h<CR>
inoremap <A-j> <Esc><cmd>wincmd j<CR>
inoremap <A-k> <Esc><cmd>wincmd k<CR>
inoremap <A-l> <Esc><cmd>wincmd l<CR>
inoremap <A-.> <Esc><cmd>tabnext<CR>
inoremap <A-,> <Esc><cmd>tabprevious<CR>

vnoremap <A-h> <cmd>wincmd h<CR>
vnoremap <A-j> <cmd>wincmd j<CR>
vnoremap <A-k> <cmd>wincmd k<CR>
vnoremap <A-l> <cmd>wincmd l<CR>
vnoremap <A-.> <cmd>tabnext<CR>
vnoremap <A-,> <cmd>tabprevious<CR>

tnoremap <A-h> <C-\><C-n><cmd>wincmd h<CR>
tnoremap <A-j> <C-\><C-n><cmd>wincmd j<CR>
tnoremap <A-k> <C-\><C-n><cmd>wincmd k<CR>
tnoremap <A-l> <C-\><C-n><cmd>wincmd l<CR>
tnoremap <A-.> <C-\><C-n><cmd>tabnext<CR>
tnoremap <A-,> <C-\><C-n><cmd>tabprevious<CR>

" Edit                                                                      {{{1
" ------------------------------------------------------------------------------
nnoremap <silent> <leader>o o<Esc>k
nnoremap <silent> <leader>O O<Esc>j
nnoremap <silent> <leader><Space> a<Space><Esc>h
nnoremap <silent> <leader><BS> i<Space><Esc>l

" Windows (splits)                                                          {{{1
" ------------------------------------------------------------------------------
        " (create) window right/left/down/up
nnoremap <silent> <leader>wr <cmd>bel vnew<CR>
nnoremap <silent> <leader>wl <cmd>abo vnew<CR>
nnoremap <silent> <leader>wd <cmd>bel new<CR>
nnoremap <silent> <leader>wu <cmd>abo new<CR>
        " window quit
nnoremap <leader>wq <cmd>confirm q<CR>

" Tabs                                                                      {{{1
" ------------------------------------------------------------------------------
        " (create) tab right/left
nnoremap <silent> <leader>t. <cmd>.tabnew<CR>
nnoremap <silent> <leader>t, <cmd>-tabnew<CR>
        " tab help/window/terminal/quit
nnoremap <silent> <leader>tw <cmd>tab split<CR>
nnoremap <silent> <leader>tt <cmd>tab terminal<CR>
nnoremap <leader>tq <cmd>confirm tabclose<CR>

" Find (files) & Explorer                                                   {{{1
" ------------------------------------------------------------------------------
        " explorer
nnoremap <silent> <leader>ep :Explore<CR>

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
