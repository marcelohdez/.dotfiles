return {
	-- Add to lazyvim defaults
	{ "ellisonleao/gruvbox.nvim", opts = { transparent_mode = true } },
	{ "LazyVim/LazyVim", opts = { colorscheme = "gruvbox" } },
	{
		"rcarriga/nvim-notify",
		opts = {
			level = 3,
			render = "wrapped-compact",
		},
	},
	{
		"nvimdev/dashboard-nvim",
		opts = {
			config = {
				header = vim.split(string.rep("\n", 10) .. [[
 _      _ _    _ 
| |__  (_) | _| |
| '_ \ | | |/ / |
| | | || |   <| |
|_| |_|/ |_|\_\_|
|__/
          ]] .. "\n\n", "\n"),
			},
		},
	},

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
