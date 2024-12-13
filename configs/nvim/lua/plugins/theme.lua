return {
	"Mofiqul/adwaita.nvim",
	{ "LazyVim/LazyVim", opts = { colorscheme = "adwaita" } },

	{
		"rcarriga/nvim-notify",
		opts = {
			level = vim.log.levels.WARN, -- try to ignore info notis
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
