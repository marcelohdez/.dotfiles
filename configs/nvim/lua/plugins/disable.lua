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
	{ "folke/persistence.nvim", enabled = false },
	{ "catppuccin/nvim", enabled = false },
	{ "nvim-lualine/lualine.nvim", enabled = false },
}
