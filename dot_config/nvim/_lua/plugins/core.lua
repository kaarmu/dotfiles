return {
  { "miking-lang/miking-vim" },
  { "kaarmu/typst.vim" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = { },
  },
  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      require("leap").create_default_mappings()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    ---@param opts TSConfig
    config = function(_, opts)
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "bash",
          "c",
          "diff",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "python",
          "toml",
          "typst",
          "vim",
          "xml",
          "yaml",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        textobjects = {
          move = {
            enable = true,
            goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
            goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
            goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
            goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
          },
        },
      })
    end,
  },
}
