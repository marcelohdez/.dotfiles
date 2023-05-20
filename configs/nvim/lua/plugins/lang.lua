return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"simrat39/rust-tools.nvim",
			{
				"Saeckiyiw/crates.nvim",
				event = { "BufRead Cargo.toml" },
				config = function()
					require("crates").setup()
				end,
			},
		},
		opts = {
			servers = {
				bashls = {}, -- bash
				clangd = {}, -- c/c++
				-- gopls = {},
				marksman = {}, -- markdown
				rust_analyzer = {},
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
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				-- "go",
				"rust",
				"toml",
				"yaml",
			},
		},
	},
}
