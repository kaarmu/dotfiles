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

" Plug 'daeyun/vim-matlab'
Plug 'sotte/presenting.vim'
Plug 'gu-fan/riv.vim'

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
Plug 'ryanoasis/vim-devicons'

" *-- Nice to have
" Plug '9mm/vim-closer'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-signify'

" *-- Git
Plug 'tpope/vim-fugitive'

" *-- Better folding
Plug 'tmhedberg/SimpylFold'

" *-- Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" *-- LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'

call plug#end()

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

" LSP settings                                                              {{{1
set completeopt=menuone,noinsert,noselect

" }}}1

" ==============================================================================
" vim: foldmethod=marker foldlevel=0 foldtext=FoldText_vim()
