-- Neovim plugins file
-- Author: kaarmu
--------------------------------------------------------------------------------
-- Bootstraping

local packer_path = (vim.fn.stdpath('data')
                     ..'/site/pack/packer/start/packer.nvim')

if vim.fn.empty(vim.fn.glob(packer_path)) then
    local packer_bootstrap = vim.fn.system({
        'git', 'clone', '--depth','1',
        'https://github.com/wbthomason/packer.nvim',
        packer_path
    })
end


--------------------------------------------------------------------------------
-- List plugins

vim.cmd [[ packadd packer.nvim ]]

return require('packer').startup(function(use)

    use {'wbthomason/packer.nvim', opt = true}

    -- nice UX
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'glepnir/dashboard-nvim'
    use 'hoob3rt/lualine.nvim'
    use {'junegunn/goyo.vim', opt = true}

    -- theme
    use 'Mofiqul/vscode.nvim'

    -- normal dependency
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    -- treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/playground'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    -- use 'stevearc/aerial.nvim'

    -- git stuff
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'

    -- search
    use 'nvim-telescope/telescope.nvim'

    -- auto complete
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'onsails/lspkind-nvim'

    -- special language support
    use {'ziglang/zig.vim', ft = {'zig'}}

    -- Auto-sync during bootstrap
    if packer_bootstrap then
        require('packer').sync()
    end

end)
