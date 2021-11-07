call plug#begin('~/.local/share/nvim/vim-plug')

" nice UX
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'glepnir/dashboard-nvim'
Plug 'hoob3rt/lualine.nvim'

" theme
Plug 'Mofiqul/vscode.nvim'

" normal dependency
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
" Plug 'stevearc/aerial.nvim'

" git stuff
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

" search
Plug 'nvim-telescope/telescope.nvim'

" auto complete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'onsails/lspkind-nvim'

" special language support
Plug 'ziglang/zig.vim'

call plug#end()

