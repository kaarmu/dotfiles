
call plug#begin('~/.local/share/nvim/vim-plug')

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tmhedberg/SimpylFold'
Plug 'hoob3rt/lualine.nvim'

Plug 'nvim-lua/plenary.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'

Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'cohama/lexima.vim'
Plug 'ray-x/lsp_signature.nvim'
" use 'stevearc/aerial.nvim'

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'sainnhe/edge'
Plug 'kaarmu/darkplus.nvim'
Plug 'tomasiser/vim-code-dark'

Plug 'glepnir/dashboard-nvim'

" ----
Plug 'norcalli/nvim-colorizer.lua'
Plug 'famiu/nvim-reload'
Plug 'lepture/vim-jinja'
" ----

call plug#end()


let g:dashboard_default_executive = 'telescope'
