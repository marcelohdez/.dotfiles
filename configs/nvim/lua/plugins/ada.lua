return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "ada" } },
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ada_ls = {},
			},
		},
	},
	{
		"mason-org/mason.nvim",
		opts = { ensure_installed = { "ada-language-server" } },
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				ada = { "gnatformat" },
			},
			formatters = {
				gnatformat = {
					command = "gnatformat",
					args = { "--pipe", "$FILENAME" },
					stdin = false,
				},
			},
		},
	},
}
