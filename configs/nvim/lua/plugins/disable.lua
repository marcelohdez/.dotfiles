return {
	-- disable stuffs
	{
		"folke/noice.nvim",
		opts = {
			cmdline = {
				enabled = false,
			},
			messages = {
				enabled = false,
			},
			popupmenu = {
				enabled = false,
			},
		},
	},
	{
		"folke/snacks.nvim",
		opts = { notifier = { enabled = false } },
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
		},
	},
	{ "catppuccin/nvim", enabled = false },
	{ "folke/persistence.nvim", enabled = false },
	{ "MeanderingProgrammer/render-markdown.nvim", enabled = false },
	{ "nvim-lualine/lualine.nvim", enabled = false },
}
