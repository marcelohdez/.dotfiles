return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
        clangd = {},
        -- gopls = {},
        marksman = {},
        rust_analyzer = {},
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
