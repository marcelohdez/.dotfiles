return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "simrat39/rust-tools.nvim",
    },
    opts = {
      servers = {
        bashls = {},
        clangd = {},
        -- gopls = {},
        marksman = {},
        rust_analyzer = {},
      },
      setup = { -- make rust-tools work
        rust_analyzer = function(_, opts)
          require("rust-tools").setup({ server = opts })
          return true
        end,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        -- "go",
        "rust",
        "yaml",
      },
    },
  },
}
