return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "qmljs" } },
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				qmlls = {},
			},
		},
	},
	{
		"mason-org/mason.nvim",
		opts = { ensure_installed = { "qmlls" } },
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				qml = { "qmlformat" },
			},
			formatters = {
				qmlformat = {
					command = "qmlformat-qt6",
				},
			},
		},
	},
}
