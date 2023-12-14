return {
	-- here should be things not covered by default LazyVim packs
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				bashls = {}, -- bash
				clangd = {
					mason = false,
				},
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
			},
		},
	},
}
