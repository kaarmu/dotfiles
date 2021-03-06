" VIMRC FOR NEOVIM, kaarmu
" ==============================================================================
" TODO                                                                      {{{1
" ====
"   - plugins
"       - vimspector
"       - vim-bujo
"
" Installed Plugins                                                         {{{1

call plug#begin('~/.local/share/nvim/plugged')

" *-- Appearance
Plug 'morhetz/gruvbox'
" Plug 'lifepillar/vim-gruvbox8'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'nightsense/carbonized'
Plug 'nightsense/snow'
Plug 'wadackel/vim-dogrun'
Plug 'co1ncidence/mountaineer.vim'

Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'bagrat/vim-buffet'
Plug 'ryanoasis/vim-devicons'

" *-- Editing
" Plug '9mm/vim-closer' " If you want to have auto-close paranthes
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-signify'
Plug 'tmhedberg/SimpylFold'

" *-- Git
Plug 'tpope/vim-fugitive'

" *-- Telescopie
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" *-- Apps
Plug 'sotte/presenting.vim'
" Plug 'daeyun/vim-matlab', { 'do': '<cmd>UpdateRemotePlugins<CR>' }
Plug 'Shougo/deoplete.nvim', { 'do': '<cmd>UpdateRemotePlugins<CR>' }
Plug 'lervag/vimtex'
Plug 'PhilT/vim-fsharp'
Plug 'mattn/emmet-vim'

" Plug 'baabelfish/nvim-nim'
Plug 'alaviss/nim.nvim'

" *-- LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" Plug 'tjdevries/nlua.nvim'

call plug#end()


" deoplete
let g:deoplete_at_startup=1

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:conceallevel=1
let g:tex_conceal='abdmg'

" Auto groups                                                               {{{1

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup KAARMU
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Misc settings                                                              {{{1


" Neovide
set guifont=FiraCode\ Nerd\ Font,Fira\ Code,DejaVuSans\ Mono,DejaVuSans:h26

" }}}1


" ==============================================================================
" vim: foldmethod=marker foldlevel=0 foldtext=FoldText_vim()
