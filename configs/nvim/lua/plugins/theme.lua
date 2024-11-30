return {
	"Mofiqul/adwaita.nvim",
	{ "LazyVim/LazyVim", opts = { colorscheme = "adwaita" } },

	{
		"rcarriga/nvim-notify",
		opts = {
			level = 3,
			render = "wrapped-compact",
		},
	},

	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					header = [[
 _      _ _    _ 
| |__  (_) | _| |
| '_ \ | | |/ / |
| | | || |   <| |
|_| |_|/ |_|\_\_|
|__/  ]],
				},
			},
		},
	},
}
