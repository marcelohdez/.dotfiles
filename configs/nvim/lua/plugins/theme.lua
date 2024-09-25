return {
	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			palette_overrides = {
				-- match backgrounds with terminal
				dark0 = "#1b1b1b",
				light0 = "#fffefa",
				-- lighten a bit
				light1 = "#f0ead2",
			},
		},
	},
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
}
