return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"simrat39/rust-tools.nvim",
		},
		opts = {
			servers = {
				bashls = {}, -- bash
				clangd = {}, -- c/c++
				gopls = {}, -- go
				marksman = {}, -- markdown
				pylsp = {}, -- python
				rust_analyzer = {}, -- rust
				taplo = {}, -- toml
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
		"Saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"go",
				"python",
				"rust",
				"toml",
				"yaml",
			},
		},
	},
}
