return {
	-- here should be things not covered by default LazyVim packs
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				clangd = {
					mason = false,
				},
			},
		},
	},
}
