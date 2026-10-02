return {
	"ellisonleao/gruvbox.nvim",
	{ "LazyVim/LazyVim", opts = { colorscheme = "gruvbox" } },

	{
		"ibhagwan/fzf-lua",
		opts = {
			winopts = {
				fullscreen = true,
				border = "single",
				preview = {
					border = "single",
				},
			},
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
